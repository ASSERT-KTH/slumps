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
            print(f"Purging {queue_name}")
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

    def has(k):
        return connection.get(k) is not None

    def get_all_programs(prefix="", save=False, getsnapshotfirst=True):

        if getsnapshotfirst and has(f"SNAPSHOT:all_programs:{prefix}"):
            return json.loads(connection.get(f"SNAPSHOT:all_programs:{prefix}").decode())

        print("getting programs")
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

        print("Returning all programs")
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
        print(path, os.listdir(path))

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


        def plot_general_stats():

            sc = m.get_storage_message_count()
            ec = m.get_exploration_message_count()
            wc = m.get_wasm2wat_message_count()
            bc = m.get_bc2wasm_message_count()

            print("Queues count retrieved", sc, ec,  wc, bc)

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

        def generate_report_for_module(module):

            print("Getting stats for", module)
            unique_llvm = len(get_unique_bitcodes(module))
            unique_wasm = len(get_unique_wasm(module))

            total_llvm = get_total_llvm(module)
            total_wasm = get_total_wasm(module)
            
            if unique_wasm > 1:
                print(module, unique_llvm, unique_wasm, total_llvm, total_wasm)

            if total_llvm == 0 or total_wasm == 0 or unique_llvm <= 1:
                return None

            return html.Div(
                children=html.Div(
                    children=[
                        html.H2(
                            children=[

                                html.A(
                                    children=module
                                ),  # TODO go to module page
                                # TODO in module page, show size of the bitcode/wasm equality distribution
                            ]
                        ),
                        html.Div(
                            className="row",
                            children=[

                                html.H4(
                                    className="col",
                                    children=f"Unique LLVM {unique_llvm}/{total_llvm} ({unique_llvm/total_llvm*100:.2f}%)"
                                ),
                                html.A(
                                    className="btn btn-primary",
                                    children="Get bitcodes",
                                    href=f"/downloadable/{module}",
                                    style={
                                        'marginRight': '50px'
                                    }
                                )
                                ,
                                html.H4(
                                    className="col",
                                    children=f"Unique WASM {unique_wasm}/{total_wasm} ({unique_wasm/total_wasm*100:.2f}%)"
                                ),

                                html.A(
                                    className="btn btn-primary",
                                    children="Get wasms",
                                    href=f"/downloadablew/{module}",
                                    style={
                                        'marginRight': '50px'
                                    }
                                ),
                                html.A(
                                    className="btn btn-primary",
                                    children="Get wats",
                                    href=f"/downloadablewt/{module}",
                                    style={
                                        'marginRight': '50px'
                                    }
                                )
                            ]
                        ),
                        html.Div(
                          className='row',
                          children=[
                              html.Div(
                                  className='col',
                                  children=
                                dcc.Graph(
                                    id='GrapGo',
                                    figure={
                                        'data': [
                                            go.Scatter(
                                                x=[x[0] for x in total_bitcodes_queries[module]],
                                                y=[x[1] for x in total_bitcodes_queries[module]],
                                                mode="markers+lines",
                                                name="Total"
                                            ),
                                            go.Scatter(
                                                x=[x[0] for x in unique_bitcodes_queries[module]],
                                                y=[x[1] for x in unique_bitcodes_queries[module]],
                                                mode="markers+lines",
                                                name="Unique"
                                            )

                                        ]
                                    },
                                    style={
                                        'minHeight': '300px'
                                    }
                                )
                              ),
                              html.Div(
                                  className='col',
                                  children=
                                  dcc.Graph(
                                      id='GrapGo',
                                      figure={
                                          'data': [
                                              go.Scatter(
                                                  x=[x[0] for x in total_wasms_queries[module]],
                                                  y=[x[1] for x in total_wasms_queries[module]],
                                                  mode="markers+lines",
                                                  name="Total"
                                              ),
                                              go.Scatter(
                                                  x=[x[0] for x in unique_wasms_queries[module]],
                                                  y=[x[1] for x in unique_wasms_queries[module]],
                                                  mode="markers+lines",
                                                  name="Unique"
                                              )

                                          ]
                                      },
                                      style={
                                          'minHeight': '300px'
                                      }
                                  )
                              )
                          ]
                        ),
                        html.Hr()
                    ]
                ),
                style={
                    'textAlign': 'left',
                    'color': colors['text']
                }
            )
        if pathname == '/':
            programs = get_all_programs()
            print(len(programs))
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
                        html.H2(
                            children=f"DB {redis_db}"
                        ),
                        plot_general_stats()
                    ],
                    style={
                        'textAlign': 'center',
                        'color': colors['text']
                    }
                ),

                html.H2(
                    children=f"{len(programs)} Modules ",
                    style={
                        'textAlign': 'center',
                        'color': colors['text']
                    }
                ),
                html.Div(
                    style=dict(
                        padding="50px"
                    ),
                    children=list(map(generate_report_for_module, programs))
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
            dcc.Interval(id='interval1', interval=600 * 1000, n_intervals=0),
            html.Div(id='logs'),
            html.Div(id='page-content'),
        ])

        app.run_server(host="0.0.0.0", port=8050, debug=debug)

    def print_general_stats():
        programs = get_all_programs(prefix="sodium3", save=True, getsnapshotfirst=False)

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


    # deploy_dash(debug=True)
    #print_general_stats()

    
