import redis
import sys
import re
import json
import dash
import dash_core_components as dcc
import dash_html_components as html
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


class RabbitMonitor:

    def __init__(self):
        BROKER_PASS = os.getenv("BROKER_PASS", None)
        BROKER_USER = os.getenv("BROKER_USER", None)

        if BROKER_PASS and BROKER_USER:
            credentials = pika.PlainCredentials(BROKER_USER, BROKER_PASS)
            param = pika.ConnectionParameters(host=config["event"]["host"],
                                              virtual_host="/",
                                              port=config["event"].getint("port"),
                                              credentials=credentials)
        else:
            param = pika.ConnectionParameters(host=config["event"]["host"],
                                              port=config["event"].getint("port"))
        self.connection = pika.BlockingConnection(param)
        self.channel = self.connection.channel()

    def __get_message_count(self, QUEUE_NAME):

        queue = self.channel.queue_declare(
            queue=QUEUE_NAME,passive=True
        )
        return queue.method.message_count

    def __purge_queue(self, queue_name):

        print(f"Purging {queue_name}")
        self.channel.queue_purge(queue_name)

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

    connection = redis.Redis(host=redis_host,port=redis_port, db=redis_db, password=redis_pass)
    app = dash.Dash(external_stylesheets=[dbc.themes.LUX], suppress_callback_exceptions=True)


    def get_all_programs():
        print("getting programs")
        allkeys = connection.keys("*")

        r = { }

        for k in allkeys:
            kd = k.decode()

            match= PROGRAM_RE.match(kd)
            if match:
                r[match.group(1)] = { }

        return r

    def get_unique_bitcodes(program):
        bc_keys = connection.keys(f"{program}:bc:*")
        return bc_keys


    def get_eq_variants_for_bc(bitcode_key):
        variants = connection.get(f"{bitcode_key.decode()}")
        return json.loads(variants.decode()) if variants else None


    def get_eq_variants_for_wasm(wasm_key):
        variants = connection.get(f"{wasm_key.decode()}")
        return json.loads(variants.decode()) if variants else None

    def get_eq_variants_for_wat( wat_key):
        variants = connection.get(f"{wat_key.decode()}")
        return json.loads(variants.decode()) if variants else None

    def get_unique_wasm(program):
        wasm_keys = connection.keys(f"{program}:wasm:*")
        return wasm_keys

    def get_unique_wat(program):
        wat_keys = connection.keys(f"{program}:wat:*")
        return wat_keys

    def get_total_llvm(program):
        C = 0
        for bc in get_unique_bitcodes(program):
            C += len(get_eq_variants_for_bc(bc))
        return C

    def get_total_wasm(program):
        C = 0
        for bc in get_unique_wasm(program):
            C += len(get_eq_variants_for_wasm(bc))
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



    @app.callback(dash.dependencies.Output('page-content', 'children'),
                  [dash.dependencies.Input('url', 'pathname'),
                    dash.dependencies.Input('update-button', 'n_clicks')],
                  )
    def display_page(pathname, n_clicks):


        def plot_general_stats():

            return html.Div(
                style=dict(
                    padding="30px"
                ),
                 children=[
                     html.Hr(),
                     html.H2(
                         children="Broker status, pending messages"
                     ),
                     html.A(
                         style=dict(
                             marginLeft='5px'
                         ),
                         id="purge-button1",
                         className='btn btn-danger',
                         children=f"Purge",
                         key="EXPLORATION"
                     ),
                     html.Div(
                    className="row",
                    children=[
                        html.Div(
                            className='col',
                            children=[
                                html.A(
                                    children=f"Exploration queue count: {m.get_exploration_message_count()}"
                                )

                            ]
                        ),
                        html.Div(
                            className='col',
                            children=[
                                html.A(
                                    children=f"Generation queue count: {m.get_generation_message_count()}"
                                ),
                            ]
                        ),
                        html.Div(
                            className='col',
                            children=[
                                html.A(
                                    children=f"Storage queue count: {m.get_storage_message_count()}"
                                ),
                            ]
                        ),
                        html.Div(
                            className='col',
                            children=[
                                html.A(
                                    children=f"Wasm2wat queue count: {m.get_wasm2wat_message_count()}"
                                ),
                            ]
                        ),
                        html.Div(
                            className='col',
                            children=[
                                html.A(
                                    children=f"Bc2wasm queue count: {m.get_bc2wasm_message_count()}"
                                ),
                            ]
                        )
                    ]
                ),
                 html.Hr()]
            )

        def generate_report_for_module(module):

            unique_llvm = len(get_unique_bitcodes(module))
            unique_wasm = len(get_unique_wasm(module))
            unique_wat = len(get_unique_wat(module))

            total_llvm = get_total_llvm(module)
            total_wasm = get_total_wasm(module)
            total_wat = get_total_wat(module)

            if total_llvm == 0:
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
                    'marginRight': '50px'
                }
            ),
            html.Div(id='logs'),
            html.Div(id='page-content'),
        ])

        app.run_server(debug=debug)

    def print_general_stats(self):
        programs = get_all_programs()

        for k in programs.keys():

            print(k)
            bc_unique = get_unique_bitcodes(k)
            print(f"\t bitcodes {len(bc_unique)}")


            for bc in bc_unique:
                variants = get_eq_variants_for_bc(bc)
                print(f"\t\teq {len(variants)}")


            w_unique = get_unique_wasm(k)
            print(f"\t wasm {len(w_unique)}")

            wt_unique = get_unique_wat(k)
            print(f"\t wat {len(wt_unique)}")
    
    #subscriber = Subscriber(1, MONITOR_QUEUE_NAME, GENERATED_BC_KEY, config["event"].getint("port"), general_log)
    #subscriber.setup()


    deploy_dash()
