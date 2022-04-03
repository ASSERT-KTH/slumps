import redis
import sys
import re
import json
import dash
import dash_core_components as dcc
import dash_html_components as html
import dash_auth

from plotly import graph_objects as go
import dash_bootstrap_components as dbc
from crow.events import LOG_MESSAGE, GENERATED_BC_VARIANT, EXPLORATION_RESULT, BC_EXPLORATION_QUEUE, GENERATION_QUEUE, \
    WAT_QUEUE, WASM_QUEUE
from crow.monitor.logger import ERROR
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.monitor.minpeewee.readdb import SubscriberStats, WasmFile, BCFile, WatFile,  Projection, Module, Variant
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

if __name__ == "__main__":

    m = RabbitMonitor()
    m.get_exploration_message_count()

    redis_host = sys.argv[1]
    redis_port = int(sys.argv[2])
    redis_db = sys.argv[3]
    redis_pass = sys.argv[4]
    out_folder = sys.argv[5]

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
    function_queries = {}

    def has(k):
        return connection.get(k) is not None

    def get_all_workers():
        stats = SubscriberStats.select()
        
        for s in stats:
            if s.id not in worker_queries:
                worker_queries[s.id] = []
            worker_queries[s.id].append([time.time() - NOW, s.queue_size])
        # print(worker_queries)
        return worker_queries
    
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
                unique = len(wasms_by_hash.keys())
                total = sum([len(i) for _, i in wasms_by_hash.items()])
                # functions[function] = dict(wasms=wasms_by_hash, unique=unique, total=total)
                if final:
                    functions[function] = {
                        final: dict(unique=unique, total=total)
                    }
                else:
                    functions[function] = dict(unique=unique, total=total)


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
                        function_queries[(m, f, i)] = [[],[]]
                        function_queries[(m, f, i)] = [[], []]
                    else:
                        t = wasms[m][f][i]['total']
                        u = wasms[m][f][i]['unique']
                        n = time.time() - NOW
                        function_queries[(m, f, i)][0].append([n, t])
                        function_queries[(m, f, i)][1].append([n, u])
                

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


    @app.callback(dash.dependencies.Output('logs', 'children'),
                  [dash.dependencies.Input('purge-button1', 'n_clicks'),
                   dash.dependencies.Input('purge-button1', 'key')],
                  )
    def purge_exploration(n_clicks, key):

        if n_clicks and key == "EXPLORATION":
            return m.purge_exploration_queue()


        return None


    '''
     html.A(
                         style=dict(
                             marginLeft='5px'
                         ),
                         id="purge-button1",
                         className='btn btn-danger',
                         children=f"Purge",
                         key="EXPLORATION"
                     ),
    '''
    @app.callback(dash.dependencies.Output('page-content', 'children'),
                  [dash.dependencies.Input('url', 'pathname'),
                    dash.dependencies.Input('interval1', 'n_intervals'),
                    dash.dependencies.Input('update-button', 'n_clicks')],
                  )
    def display_page(pathname, n_clicks, n_intervals):

        def plot_worker_stats(w):
            id, values = w
            name = id[:id.find("-")]

            return html.Div(
                            className='col col-md-4',
                            children=dcc.Graph(
                                    figure={
                                        'data': [
                                            go.Scatter(
                                                x=[x[0] for x in values],
                                                y=[x[1] for x in values],
                                                mode="markers+lines",
                                                name="pending jobs"
                                            ),
                                        ],
                                        'layout': {
                                            'title': f'{name}'
                                        }
                                    }
                                )

                        )

        def plot_function(f):
            mod, functionname, wasms = f
            if functionname == "original":
                return None

            #print(function_queries)

            if (mod, functionname, 'bcs') in function_queries:
                total_bcs = function_queries[(mod, functionname, 'bcs')][0]
                unique_bcs = function_queries[(mod, functionname, 'bcs')][1]
                bcratio = 100*unique_bcs[-1][1]/total_bcs[-1][1]
            else:
                total_bcs = []
                unique_bcs = []
                bcratio = 100
            
            if (mod, functionname, 'wasms') in function_queries:
                total_wasms = function_queries[(mod, functionname, 'wasms')][0]
                unique_wasms = function_queries[(mod, functionname, 'wasms')][1]
                wasmratio = 100*unique_wasms[-1][1]/total_wasms[-1][1]
            else:
                total_wasms = []
                unique_wasms = []
                wasmratio = 100

            
            if (mod, functionname, 'wats') in function_queries:
                total_wats = function_queries[(mod, functionname, 'wats')][0]
                unique_wats = function_queries[(mod, functionname, 'wats')][1]
                watratio = 100*unique_wats[-1][1]/total_wats[-1][1]
            else:
                total_wats = []
                unique_wats = []
                watratio=100

            #print(total_wasms, unique_wasms, mod, functionname, wasms)
            return html.Div(
                children = [

                        html.H5(
                            children=f"{functionname}"
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
                                                    mode="markers+lines",
                                                    name="total bc"
                                                ),
                                                go.Scatter(
                                                    x=[x[0] for x in unique_bcs],
                                                    y=[x[1] for x in unique_bcs],
                                                    mode="markers+lines",
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
                                                    mode="markers+lines",
                                                    name="total wasm"
                                                ),
                                                go.Scatter(
                                                    x=[x[0] for x in unique_wasms],
                                                    y=[x[1] for x in unique_wasms],
                                                    mode="markers+lines",
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
                                                    mode="markers+lines",
                                                    name="total wat"
                                                ),
                                                go.Scatter(
                                                    x=[x[0] for x in unique_wats],
                                                    y=[x[1] for x in unique_wats],
                                                    mode="markers+lines",
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
                                                mode="markers+lines",
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
                                                mode="markers+lines",
                                                name="wasm2wat generation"
                                            ),
                                            go.Scatter(
                                                x=[x[0] for x in m.queries[WASM_QUEUE]],
                                                y=[x[1] for x in m.queries[WASM_QUEUE]],
                                                mode="markers+lines",
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
                                                mode="markers+lines",
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

        
        if pathname == '/':
            # programs = get_all_programs()
            workers = get_all_workers()
            wasms = get_all_wasms()
            #print(len(wasms))
            colors = {
                'background': '#FFFFFF',
                'text': '#000000'
            }
            return html.Div(style={'backgroundColor': colors['background']}, children=[
                html.Div(
                    children=[
                        html.H1(
                            children='CROW dashboard'
                        ),
                        plot_general_stats()
                    ],
                    style={
                        'textAlign': 'center',
                        'color': colors['text']
                    }
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
                    style=dict(
                        padding="50px"
                    ),
                    children=list(map(plot_modules, wasms.items()))
                )

            ])



    def deploy_dash(debug=True):



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

        app.run_server(host="0.0.0.0", port=8050, debug=debug)

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


    deploy_dash(debug=False)
    #print_general_stats()


