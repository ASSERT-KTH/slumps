import redis
import sys
import re
import json
from crow.dashboard_utils import is_wasm_file, is_c_file, is_bc_file
from crow.events import SPAWN_COMMAND
import dash
from dash import dcc
from dash import html
import dash_auth
import base64
from dash import Input, Output, State
from dash import callback_context as ctx
from dash.exceptions import PreventUpdate

from plotly import graph_objects as go
import plotly.express as px
import dash_bootstrap_components as dbc
from crow.events import LOG_MESSAGE, GENERATED_BC_VARIANT, EXPLORATION_RESULT, BC_EXPLORATION_QUEUE, GENERATION_QUEUE, \
    WAT_QUEUE, WASM_QUEUE
from crow.monitor.logger import ERROR
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.monitor.minpeewee.readdb import SubscriberStats, WasmFile, BCFile, WatFile,  Projection, Module, Variant
from crow.entrypoints import bc2wasm, fromc
import traceback
from crow.settings import config
from crow.monitor import MONITOR_QUEUE_NAME
from crow.storage import STORAGE_QUEUE_NAME
from crow.utils import printProgressBar
from zipfile import ZipFile
import os
import flask
from shutil import make_archive
from flask.helpers import send_file
import pika
import time

NOW = time.time()
class RabbitMonitor:

    def __init__(self, save_query=True):

        self.__setup()
        self.save_query = save_query
        self.queries = {  }

    def __setup(self):
        BROKER_PASS = os.getenv("BROKER_PASS", None)
        BROKER_USER = os.getenv("BROKER_USER", None)

        if BROKER_PASS and BROKER_USER:
            credentials = pika.PlainCredentials(BROKER_USER, BROKER_PASS)
            print("Connecting with credentials", config['event']['host'])
            param = pika.ConnectionParameters(host=config["event"]["host"],
                                              virtual_host="/",
                                              port=config["event"].getint("port"),
                                              credentials=credentials)
        else:
            param = pika.ConnectionParameters(host=config["event"]["host"],
                                              port=config["event"].getint("port"))
        while True:
            try:
                self.connection = pika.BlockingConnection(param)
                self.channel = self.connection.channel()
                break
            except Exception as e:
                print("Error connecting", e, traceback.format_stack())
                time.sleep(5)

    def __get_message_count(self, QUEUE_NAME):

        try:
            queue = self.channel.queue_declare(
                queue=QUEUE_NAME,passive=True
            )

            if self.save_query:
                if QUEUE_NAME not in self.queries:
                    self.queries[QUEUE_NAME] = []

                self.queries[QUEUE_NAME].append((
                    time.time() - NOW,
                    queue.method.message_count
                ))
            return queue.method.message_count
        except Exception:
            time.sleep(3) # waiting 3 seconds
            self.__setup()


    def __purge_queue(self, queue_name):

        try:
            #print(f"Purging {queue_name}")
            self.channel.queue_purge(queue_name)
        except Exception:
            time.sleep(3)
            self.__setup()
    def purge_exploration_queue(self):
        self.__purge_queue(BC_EXPLORATION_QUEUE)

    def purge_generation_queue(self):
        self.__purge_queue(GENERATION_QUEUE)

    def purge_storage_queue(self):
        self.__purge_queue(STORAGE_QUEUE_NAME)

    def purge_wasm2wat_queue(self):
        self.__purge_queue(WASM_QUEUE)

    def purge_wat2wasm_queue(self):
        self.__purge_queue(WAT_QUEUE)

    def get_exploration_message_count(self):
        return self.__get_message_count(BC_EXPLORATION_QUEUE)

    def get_generation_message_count(self):
        return self.__get_message_count(GENERATION_QUEUE)

    def get_storage_message_count(self):
        return self.__get_message_count(STORAGE_QUEUE_NAME)

    def get_wasm2wat_message_count(self):
        return self.__get_message_count(WAT_QUEUE)

    def get_bc2wasm_message_count(self):
        return self.__get_message_count(WASM_QUEUE)

PROGRAM_RE = re.compile(r"^(.+?):")
BASE_DIR = os.path.dirname(__file__)

worker_callbacks_added = False
def main(redis_host, redis_port,redis_db,redis_pass, out_folder, host="0.0.0.0", port=8050, debug=False):

    m = RabbitMonitor()
    m.get_exploration_message_count()

    VALID_USERNAME_PASSWORD_PAIRS = {
    }
    if os.getenv("BROKER_USER"):
        VALID_USERNAME_PASSWORD_PAIRS[os.getenv("BROKER_USER")] = os.getenv("BROKER_PASS")
    else:
        exit(0)

    connection = redis.Redis(host=redis_host,port=redis_port, db=redis_db, password=redis_pass)
    app = dash.Dash(external_stylesheets=[dbc.themes.LUX], suppress_callback_exceptions=True)
    auth = dash_auth.BasicAuth(
        app,
        VALID_USERNAME_PASSWORD_PAIRS
    )

    unique_bitcodes_queries = {}
    total_bitcodes_queries = {}

    unique_wasms_queries = {}
    total_wasms_queries = {}

    worker_queries = {}
    worker_cpu_queries = {}
    worker_memory_queries = {}
    
    function_queries = {}
    all_distribs = {}

    publisher = Publisher()  


    def has(k):
        return connection.get(k) is not None

    def get_all_nodes():

        try:
            stats = SubscriberStats.select()
            
            stats = group_by(lambda x: x.node_name, stats)
            for nid, values in stats.items():
                s = values[0]
                if nid not in worker_cpu_queries:
                    worker_cpu_queries[nid] = []
                    worker_memory_queries[nid] = []

                worker_memory_queries[nid].append([time.time() - NOW, s.cpu_usage])
                worker_cpu_queries[nid].append([time.time() - NOW, json.loads(s.memory_usage)[2]])
                
            # print(worker_queries)
            return worker_memory_queries, worker_cpu_queries
        except Exception as e:
            print(e, "get_all_nodes")
            return [], []
    
    def get_all_workers():
        try:
            stats = SubscriberStats.select()
            
            for s in stats:
                if s.id not in worker_queries:
                    worker_queries[s.id] = []

                worker_queries[s.id].append([time.time() - NOW, s.queue_size])
            # print(worker_queries)
            return worker_queries
        except Exception as e:
            print(e, "get_all_workers")
            return {}

    def merget(m, d):
        
        for k in d.__dict__.keys():
            setattr(m, k, getattr(d, k))

        return m

    def group_by(keyextractor, collection):
        result = {}

        for i in collection:
            k = keyextractor(i)

            if k not in result:
                result[k] = []
            result[k].append(i)

        
        return result

    def aggregate(collection, final=""):

        result = {}


        for module, variants in collection.items():
            functions = group_by(lambda x: x.function_name, variants)

            for function, variants in functions.items():
                wasms_by_hash = group_by(lambda x: x.hsh, variants)
                levelwasms = group_by(lambda x: x.level, variants)

                unique = len(wasms_by_hash.keys())
                total = sum([len(i) for _, i in wasms_by_hash.items()])
                distrib = [ (k, len(levelwasms[k])) for k in levelwasms.keys() ]

                # functions[function] = dict(wasms=wasms_by_hash, unique=unique, total=total)
                if final:
                    functions[function] = {
                        final: dict(unique=unique, total=total, levels=distrib)
                    }
                else:
                    functions[function] = dict(unique=unique, total=total, levels=distrib)


            result[module] = functions

        return result

    def merge_dicts(d1, d2):

        # Module level
        for k in d2.keys():
            if k not in d1:
                d1[k] = d2[k]
            else:
                # function level
                for fkey in d2[k].keys():
                    if fkey not in d1[k]:
                        d1[k][fkey] = d2[k][fkey]
                    else:
                        for hkey in d2[k][fkey].keys():
                            if hkey not in d1[k][fkey]:
                                d1[k][fkey][hkey] = d2[k][fkey][hkey]
                    

    def get_all_wasms():
        wasms = WasmFile.select()
        wats = WatFile.select()
        bcs = BCFile.select()

        wasms = [ merget(w, Projection.get_projection(w)) for w in wasms ]
        wats = [ merget(w, Projection.get_projection(w)) for w in wats ]
        bcs = [ merget(w, Projection.get_projection(w, field= lambda x: x.original.file_name)) for w in bcs ]

        # get levels

        # Group by module        
        wasms = group_by(lambda x: x.module_name, wasms)
        wats = group_by(lambda x: x.module_name, wats)
        bcs = group_by(lambda x: x.module_name, bcs)

        wasms = aggregate(wasms, "wasms")
        wats = aggregate(wats, "wats")
        bcs = aggregate(bcs, "bcs")

        # Merge all
        merge_dicts(wasms, wats)
        merge_dicts(wasms, bcs)

        # print(json.dumps(wasms, indent=4))

        for m in wasms.keys():
            for f in wasms[m].keys():
                for i in wasms[m][f].keys():
                    if (m, f, i) not in function_queries:
                        function_queries[(m, f, i)] = [[],[], []]
                        function_queries[(m, f, i)] = [[], [], []]
                    else:
                        t = wasms[m][f][i]['total']
                        u = wasms[m][f][i]['unique']
                        l = wasms[m][f][i]['levels']
                        n = time.time() - NOW
                        function_queries[(m, f, i)][0].append([n, t])
                        function_queries[(m, f, i)][1].append([n, u])
                        function_queries[(m, f, i)][2] = l
                

        return wasms

    def get_all_programs(prefix="", save=False, getsnapshotfirst=True):

        if getsnapshotfirst and has(f"SNAPSHOT:all_programs:{prefix}"):
            return json.loads(connection.get(f"SNAPSHOT:all_programs:{prefix}").decode())

        #print("getting programs")
        allkeys = connection.keys(f"{prefix}*")

        r = { }

        print("keys retrieved")
        for k in allkeys:
            kd = k.decode()

            match= PROGRAM_RE.match(kd)
            if match:
                r[match.group(1)] = { }


        if save:
            connection.set(f"SNAPSHOT:all_programs:{prefix}", json.dumps(r).encode())

        #print("Returning all programs")
        return r

    def get_unique_bitcodes(program, save=False, getsnapshotfirst=True):
        if getsnapshotfirst and has(f"SNAPSHOT:unique_bitcodes:{program}"):
            return json.loads(connection.get(f"SNAPSHOT:unique_bitcodes:{program}").decode())

        bc_keys = connection.keys(f"{program}:bc:*")

        if program not in unique_bitcodes_queries:
            unique_bitcodes_queries[program] = []

        unique_bitcodes_queries[program].append((
            time.time() - NOW,
            len(bc_keys)
        ))

        if save:
            connection.set(f"SNAPSHOT:unique_bitcodes:{program}", json.dumps([k.decode() for k in bc_keys]).encode())

        return bc_keys


    def get_eq_variants_for_bc(bitcode_key):

        try:
            variants = connection.get(f"{bitcode_key.decode()}")
        except:
            variants = connection.get(f"{bitcode_key}")
        return json.loads(variants.decode()) if variants else None


    def get_eq_variants_for_wasm(wasm_key):
        variants = connection.get(f"{wasm_key.decode()}")
        return json.loads(variants.decode()) if variants else None

    def get_eq_variants_for_wat( wat_key):
        variants = connection.get(f"{wat_key.decode()}")
        return json.loads(variants.decode()) if variants else None

    def get_unique_wasm(program):
        wasm_keys = connection.keys(f"{program}:wasm:*")

        if program not in unique_wasms_queries:
            unique_wasms_queries[program] = []

        unique_wasms_queries[program].append((
            time.time() - NOW,
            len(wasm_keys)
        ))
        return wasm_keys

    def get_unique_wat(program):
        wat_keys = connection.keys(f"{program}:wat:*")
        return wat_keys

    def get_total_llvm(program):
        C = 0
        for bc in get_unique_bitcodes(program):
            C += len(get_eq_variants_for_bc(bc))

        if program not in total_bitcodes_queries:
            total_bitcodes_queries[program] = []
        total_bitcodes_queries[program].append((
            time.time() - NOW,
            C
        ))
        return C

    def get_total_wasm(program):
        C = 0
        for bc in get_unique_wasm(program):
            C += len(get_eq_variants_for_wasm(bc))


        if program not in total_wasms_queries:
            total_wasms_queries[program] = []


        total_wasms_queries[program].append((
            time.time() - NOW,
            C
        ))
        return C

    def get_total_wat(program):
        C = 0
        for bc in get_unique_wat(program):
            C += len(get_eq_variants_for_wat(bc))
        return C

    def make_zip(path, name="out"):
        #print(path, os.listdir(path))

        make_archive(
            f'{BASE_DIR}/{name}',
            'zip',  # the archive format - or tar, bztar, gztar
            root_dir=path,  # root for archive - current working dir if None
            base_dir=None)  # start archiving from here - cwd if None too

        return f"{name}.zip"

    @app.server.route('/downloadable/<path:program_name>')
    def serve_static_bitcodes(program_name):

        o = make_zip(f"{out_folder}/{program_name}/bitcodes/variants", "bitcodes")

        return flask.send_from_directory(
            BASE_DIR, o, as_attachment=True,cache_timeout=0
        )


    @app.server.route('/downloadablew/<path:program_name>')
    def serve_static_wasms(program_name):

        o = make_zip(f"{out_folder}/{program_name}/wasm", "wasms")

        return flask.send_from_directory(
            BASE_DIR, o, as_attachment=True, cache_timeout=0
        )


    @app.server.route('/downloadablewt/<path:program_name>')
    def serve_static_wat(program_name):

        o = make_zip(f"{out_folder}/{program_name}/wat", "wats")

        return flask.send_from_directory(
            BASE_DIR, o, as_attachment=True, cache_timeout=0
        )

    @app.callback(
        Output("file-list", component_property="children"),
        [Input("upload-module", "filename"), Input("upload-module", "contents")],
    )
    def submit_bitcode(uploaded_filename, uploaded_file_content):
        ctx = dash.callback_context

        if ctx.triggered_id:
            print(ctx.triggered_id)
            if uploaded_filename:
                print(uploaded_filename, len(uploaded_file_content))
                stream = uploaded_file_content.encode("utf8").split(b";base64,")[1]
                stream = base64.decodebytes(stream)
                # TODO classify file and create the corresponding event, fromC, fromLL, from BC, error otherwise
                
                if is_wasm_file(stream):
                    return "Sorry, wasm2wasm is not yet supported"
                elif is_bc_file(stream):
                    # Call bc2wasm event
                    bc2wasm.bc2wasm(publisher, stream, uploaded_filename, uploaded_filename, explore=True)
                    return "BC file enqueued for diversification"
                elif is_c_file(stream):
                    fromc.main(uploaded_filename, stream)
                    return "BC file enqueued for diversification"
                else:
                    return "Invalid file type"
            
        return None

    # Inject the callbacks for the workers
    #

    @app.callback(dash.dependencies.Output('page-content', 'children'),
                  [dash.dependencies.Input('url', 'pathname'),
                    dash.dependencies.Input('interval1', 'n_intervals'),
                    dash.dependencies.Input('update-button', 'n_clicks')],
                  )
    def display_page(pathname, n_clicks, n_intervals):

        def plot_node_stats(w):
            id, values = w
            cpus, mems = values

            return html.Div(
                
                className='col col-md-4',
                children=[ 
                    html.H4(f"{id}"),
                    html.Div(
                            children=dcc.Graph(
                                    figure={
                                        'data': [
                                            go.Scatter(
                                                x=[x[0] for x in cpus],
                                                y=[x[1] for x in cpus],
                                                mode="lines",
                                                name="CPU usage"
                                            ),
                                            go.Scatter(
                                                x=[x[0] for x in mems],
                                                y=[x[1] for x in mems],
                                                mode="lines",
                                                name="Memory usage"
                                            ),
                                        ],
                                        'layout': {
                                            'title': f'Node pressure'
                                        }
                                    }
                                )

                        )
                        ]
            )

        def plot_worker_stats(w):
            id, values = w
            #values, cpus, mems = values
            name = id[:id.find("-")]

            return html.Div(
                
                className='col col-md-4',
                children=[ 
                    html.Div(
                        children=[

                            html.Button("Clone worker", id=f"worker-{id}", className="btn btn-primary"),
                        ],
                        style={
                            "padding": "80px"
                        }
                    ),
                    html.Div(
                            children=dcc.Graph(
                                    figure={
                                        'data': [
                                            go.Scatter(
                                                x=[x[0] for x in values],
                                                y=[x[1] for x in values],
                                                mode="lines",
                                                name="pending jobs"
                                            ),
                                        ],
                                        'layout': {
                                            'title': f'{name}'
                                        }
                                    }
                                )

                        )
                        ]
            )

        def plot_function(f):
            mod, functionname, wasms = f
            if functionname == "original":
                return None

            decoded = functionname
            if decoded.startswith("bc_"):
                decoded = decoded[3:]
                decoded = base64.b64decode(decoded.encode("utf-8"))
                decoded = decoded.decode("utf-8")

            # print(function_queries)
            distrib = []
            if (mod, functionname, 'bcs') in function_queries:
                total_bcs = function_queries[(mod, functionname, 'bcs')][0]
                unique_bcs = function_queries[(mod, functionname, 'bcs')][1]
                bcratio = 100*unique_bcs[-1][1]/total_bcs[-1][1]

                # Level, seed distribution
                distrib = function_queries[(mod, functionname, 'bcs')][2]

                for l, n in distrib:
                    if l not in all_distribs:
                        all_distribs[l] = 0
                    all_distribs[l] += n - 1
            else:
                total_bcs = [0]
                unique_bcs = [0]
                bcratio = 100
            
            if (mod, functionname, 'wasms') in function_queries:
                total_wasms = function_queries[(mod, functionname, 'wasms')][0]
                unique_wasms = function_queries[(mod, functionname, 'wasms')][1]
                wasmratio = 100*unique_wasms[-1][1]/total_wasms[-1][1]
            else:
                total_wasms = [0]
                unique_wasms = [0]
                wasmratio = 100

            
            if (mod, functionname, 'wats') in function_queries:
                total_wats = function_queries[(mod, functionname, 'wats')][0]
                unique_wats = function_queries[(mod, functionname, 'wats')][1]
                watratio = 100*unique_wats[-1][1]/total_wats[-1][1]
            else:
                total_wats = [0]
                unique_wats = [0]
                watratio=100

            #print(total_wasms, unique_wasms, mod, functionname, wasms)
            return html.Div(
                children = [
                        html.H5(
                            children=f"{decoded}"
                        ),
                        html.Div(
                            className="row",
                            children = [
                                html.Div(
                                    className="col col-md-6",
                                    children = dcc.Graph(
                                        figure={
                                            'data': [
                                                {'x': [x[0] for x in distrib], 'y': [x[1] for x in distrib], 'type': 'bar'}
                                            ],
                                            'layout': {
                                                'title': f'Levels distribution'
                                            }
                                        }
                                    )
                                )
                            ]
                        ),
                        html.Div(
                        className='row',
                        children = [
                            html.Div(
                                className='col col-md-4',
                                children=dcc.Graph(
                                        figure={
                                            'data': [
                                                go.Scatter(
                                                    x=[x[0] for x in total_bcs],
                                                    y=[x[1] for x in total_bcs],
                                                    mode="lines",
                                                    name="total bc"
                                                ),
                                                go.Scatter(
                                                    x=[x[0] for x in unique_bcs],
                                                    y=[x[1] for x in unique_bcs],
                                                    mode="lines",
                                                    name="unique bc"
                                                )
                                            ],
                                            'layout': {
                                                'title': f'bitcodes ({bcratio})'
                                            }
                                        }
                                    )
                                ),
                                html.Div(
                                    className='col col-md-4',
                                    children=dcc.Graph(
                                            figure={
                                                'data': [
                                                    go.Scatter(
                                                        x=[x[0] for x in total_wasms],
                                                        y=[x[1] for x in total_wasms],
                                                        mode="lines",
                                                        name="total wasm"
                                                    ),
                                                    go.Scatter(
                                                        x=[x[0] for x in unique_wasms],
                                                        y=[x[1] for x in unique_wasms],
                                                        mode="lines",
                                                        name="unique wasm"
                                                    )
                                                ],
                                                'layout': {
                                                    'title': f'wasm ({wasmratio})'
                                                }
                                            }
                                        )
                                    ),
                                html.Div(
                                className='col col-md-4',
                                children=dcc.Graph(
                                        figure={
                                            'data': [
                                                go.Scatter(
                                                    x=[x[0] for x in total_wats],
                                                    y=[x[1] for x in total_wats],
                                                    mode="lines",
                                                    name="total wat"
                                                ),
                                                go.Scatter(
                                                    x=[x[0] for x in unique_wats],
                                                    y=[x[1] for x in unique_wats],
                                                    mode="lines",
                                                    name="unique wat"
                                                )
                                            ],
                                            'layout': {
                                                'title': f'wat ({watratio})'
                                            }
                                        }
                                    )
                                )
                        ]
                    )
                ]
            )
            
            


        def plot_modules(w):
            name, functions = w
            functions = [ (name, *i) for i in functions.items() ]

            return html.Div(
                            # className='col col-md-4',
                            children=html.Div(children=[
                                html.H4(
                                    children=f"{name} ({len(functions)})"
                                ),
                                html.Div(
                                    # className='row',
                                    children = list(map(plot_function, functions))
                                )]
                            )

                        )

        def plot_general_stats():

            sc = m.get_storage_message_count()
            ec = m.get_exploration_message_count()
            wc = m.get_wasm2wat_message_count()
            bc = m.get_bc2wasm_message_count()

            #print("Queues count retrieved", sc, ec,  wc, bc)

            return html.Div(
                style=dict(
                    padding="30px"
                ),
                 children=[
                     html.Hr(),
                     html.H2(
                         children="Broker status, pending messages"
                     ),
                     html.Div(
                    className="row",
                    children=[
                        html.Div(
                            className='col col-md-4',
                            children=dcc.Graph(
                                    figure={
                                        'data': [
                                            go.Scatter(
                                                x=[x[0] for x in m.queries[BC_EXPLORATION_QUEUE]],
                                                y=[x[1] for x in m.queries[BC_EXPLORATION_QUEUE]],
                                                mode="lines",
                                                name="test"
                                            )

                                        ],
                                        'layout': {
                                            'title': f'Exploration queue {ec}'
                                        }
                                    },

                                )
                        ),
                        html.Div(
                            className='col col-md-4',
                            children=dcc.Graph(
                                    figure={
                                        'data': [
                                            go.Scatter(
                                                x=[x[0] for x in m.queries[WAT_QUEUE]],
                                                y=[x[1] for x in m.queries[WAT_QUEUE]],
                                                mode="lines",
                                                name="wasm2wat generation"
                                            ),
                                            go.Scatter(
                                                x=[x[0] for x in m.queries[WASM_QUEUE]],
                                                y=[x[1] for x in m.queries[WASM_QUEUE]],
                                                mode="lines",
                                                name="bc2wasm generation"
                                            )

                                        ],
                                        'layout': {
                                            'title': f'Generation queue {wc}, {bc}'
                                        }
                                    }
                                )

                        ),
                        html.Div(
                            className='col col-md-4',
                            children=dcc.Graph(
                                    figure={
                                        'data': [
                                            go.Scatter(
                                                x=[x[0] for x in m.queries[STORAGE_QUEUE_NAME]],
                                                y=[x[1] for x in m.queries[STORAGE_QUEUE_NAME]],
                                                mode="lines",
                                                name="test"
                                            )

                                        ],
                                        'layout': {
                                            'title': f'Storage queue {sc}'
                                        }
                                    }
                                )
                        )
                    ]
                )])

        
        #if pathname == '/':
        # programs = get_all_programs()
        workers = get_all_workers()
        #for k in workers.keys():
        global worker_callbacks_added

        if not worker_callbacks_added:
            @app.callback(
                Output("workers_status", component_property='children'),
                *[ Input(f"worker-{id}", "n_clicks") for id in workers.keys() ],
                prevent_initial_call=True
            )
            def on_worker_spawn(*buttons):
                triggered_id = dash.callback_context.triggered[0]['prop_id']
                print(triggered_id)

                for i, btn in enumerate(buttons):
                    if btn:
                        # Spawn that worker
                        ki = list(workers.keys())[i]
                        print(f"Spawning {ki}")
                        publisher.publish(message=dict(
                            event_type=SPAWN_COMMAND,
                            workername=ki
                        ), routing_key="crow.spawn")

                        return f"Spawning worker {ki}"
                raise PreventUpdate
            worker_callbacks_added = True

        wasms = get_all_wasms()
        nodescpu, nodesmem = get_all_nodes()

        overall = {} 

        for k in nodescpu.keys():
            overall[k] = [nodescpu[k], nodesmem[k]]

        #print(len(wasms))
        colors = {
            'background': '#FFFFFF',
            'text': '#000000'
        }
        all_distribs = {}

        per_modules = html.Div(
                style=dict(
                    padding="50px"
                ),
                children=list(map(plot_modules, wasms.items()))
            )
        return html.Div(style={'backgroundColor': colors['background']}, children=[
            html.Div(
                children=[
                    html.H1(
                        children=f'CROW dashboard ({time.time() - NOW})'
                    ),

                    html.Div(
                        
                        style=dict(
                            padding="50px"
                        ),
                        children=[dcc.Upload(
                            id="upload-module",
                            children=html.Div(
                                ["Drag and drop or click to select a file to upload and pass to CROW."]
                            ),
                            style={
                                "width": "100%",
                                "height": "60px",
                                "lineHeight": "60px",
                                "borderWidth": "1px",
                                "borderStyle": "dashed",
                                "borderRadius": "5px",
                                "textAlign": "center",
                                "margin": "10px",
                            },
                        ),                  
                        html.Ul(id="file-list")]
                    ),
                    plot_general_stats()
                ],
                style={
                    'textAlign': 'center',
                    'color': colors['text']
                }
            ),
            html.H2(
                children=f"Nodes ",
                style={
                    'textAlign': 'center',
                    'color': colors['text']
                }
            ),
            html.Div(
                
                className="row",
                style=dict(
                    padding="50px"
                ),
                children=list(map(plot_node_stats, overall.items()))
            ),
            html.Div(
                id="workers_status",
                children = []
            ),
            html.H2(
                children=f"Workers ",
                style={
                    'textAlign': 'center',
                    'color': colors['text']
                }
            ),
            html.Div(
                
                className="row",
                style=dict(
                    padding="50px"
                ),
                children=list(map(plot_worker_stats, workers.items()))
            ),
            html.H2(
                children=f"{len(wasms)} Modules ",
                style={
                    'textAlign': 'center',
                    'color': colors['text']
                }
            ),
            html.Div(
                className="row",
                children = [
                    html.Div(
                        className="col col-md-12",
                        children = dcc.Graph(
                            figure={
                                'data': [
                                    {'x': [x for x in all_distribs.keys()], 'y': [x for x in all_distribs.values()], 'type': 'bar'}
                                ],
                                'layout': {
                                    'title': f'Levels distribution'
                                }
                            }
                        )
                    )
                ]
            ),
            per_modules
        ])



    def deploy_dash(debug):



        app.layout = html.Div(children=[
            dcc.Location(id='url', refresh=False),
            html.A(
                className="btn btn-default",
                id="update-button",
                children="Reload",
                style={
                    'marginRight': '50px',
                    'position':'fixed',
                    'zIndex': '99999'
                }
            ),
            dcc.Interval(id='interval1', interval=600 * 10, n_intervals=0),
            html.Div(id='logs'),
            html.Div(id='page-content'),
        ])

        app.run_server(debug=debug, host=host, port=port)

    def print_general_stats():
        programs = get_all_programs(prefix="sodium3", save=True, getsnapshotfirst=False)
        workers = get_all_workers()

        #print("workers", workers)
        for k in programs.keys():

            print(k)
            bc_unique = get_unique_bitcodes(k, save=True, getsnapshotfirst=False)
            print(f"\t bitcodes {len(bc_unique)}")


            print("\t\teq ", end="")
            for bc in bc_unique:
                variants = get_eq_variants_for_bc(bc)
                print(f"{len(variants)}", end=" ")

            print()


            w_unique = get_unique_wasm(k)
            print(f"\t wasm {len(w_unique)}")

    
    #subscriber = Subscriber(1, MONITOR_QUEUE_NAME, GENERATED_BC_KEY, config["event"].getint("port"), general_log)
    #subscriber.setup()


    deploy_dash(debug=debug)
    #print_general_stats()


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4], sys.argv[5], debug=True)

