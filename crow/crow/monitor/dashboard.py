import redis
import sys
import re
import json
import dash
import dash_core_components as dcc
import dash_html_components as html
from plotly import graph_objects as go
import dash_bootstrap_components as dbc
from crow.events import LOG_MESSAGE, GENERATED_BC_VARIANT, EXPLORATION_RESULT
from crow.monitor.logger import ERROR
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
import traceback
from crow.settings import config
from crow.monitor import MONITOR_QUEUE_NAME
from crow.utils import printProgressBar
from zipfile import ZipFile
import os
import flask
from shutil import make_archive
from flask.helpers import send_file


PROGRAM_RE = re.compile(r"^(.+?):")
BASE_DIR = os.path.dirname(__file__)

if __name__ == "__main__":

    redis_host = sys.argv[1]
    redis_port = int(sys.argv[2])
    redis_db = sys.argv[3]
    redis_pass = sys.argv[4]
    out_folder = sys.argv[5]

    connection = redis.Redis(host=redis_host,port=redis_port, db=redis_db, password=redis_pass)
    app = dash.Dash(external_stylesheets=[dbc.themes.LUX])


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


    @app.callback(dash.dependencies.Output('page-content', 'children'),
                  [dash.dependencies.Input('url', 'pathname'),
                    dash.dependencies.Input('update-button', 'n_clicks')],
                  )
    def display_page(pathname, n_clicks):

        def plot_general_stats():

            programs = list(get_all_programs().keys())

            x = programs
            y = [ len(get_unique_bitcodes(p)) for p in programs]
            t = [ get_total_llvm(p) for p in programs]

            return None
            '''dcc.Graph(
                            id=f'GeneralGraph',
                            figure={
                                'data': [

                                    go.Bar(
                                        name="Unique",
                                        x=x,
                                        y=y,
                                        offsetgroup=0
                                    ),
                                    go.Bar(
                                        name="Total",
                                        x=x,
                                        y=t,
                                        offsetgroup=0
                                    )
                                    #{'x': [1, 2, 3], 'y': [2, 4, 5], 'type': 'bar', 'name': 'WASM'},
                                ],
                                'layout': {
                                    'plot_bgcolor': colors['background'],
                                    'paper_bgcolor': colors['background'],
                                    'font': {
                                        'color': colors['text']
                                    },
                                    'barmode': 'stack'
                                }
                            },
                            style={
                                'marginBottom': '60px'
                            }
                        )
            '''

        def generate_report_for_module(module):

            unique_llvm = len(get_unique_bitcodes(module))
            unique_wasm = len(get_unique_wasm(module))
            unique_wat = len(get_unique_wat(module))

            total_llvm = get_total_llvm(module)
            total_wasm = get_total_wasm(module)
            total_wat = get_total_wat(module)

            '''
            
            '''
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
                                    children="Download bitcodes",
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
                                    children="Download wasms",
                                    href=f"/downloadablew/{module}",
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
                        html.H2(
                            children=f"{len(programs)} Modules "
                        ),
                        plot_general_stats()
                    ],
                    style={
                        'textAlign': 'center',
                        'color': colors['text']
                    }
                ),
                html.Div(
                    className="container",
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
            html.Div(id='page-content'),
        ])
        '''
        
    
        '''
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