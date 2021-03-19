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

PROGRAM_RE = re.compile(r"^(.+?):")

'''


                        
'''

class Monitor:

    def __init__(self, redis_host, redis_port, redis_db, redis_pass):
        self.connection = redis.Redis(host=redis_host,port=redis_port, db=redis_db, password=redis_pass)
        self.redis_db = redis_db

    def get_all_programs(self):
        print("getting programs")
        allkeys = self.connection.keys("*")

        r = { }

        for k in allkeys:
            kd = k.decode()

            match= PROGRAM_RE.match(kd)
            if match:
                r[match.group(1)] = { }

        return r

    def get_unique_bitcodes(self, program):
        bc_keys = self.connection.keys(f"{program}:bc:*")
        return bc_keys


    def get_eq_variants_for_bc(self, bitcode_key):
        variants = self.connection.get(f"{bitcode_key.decode()}")
        return json.loads(variants.decode()) if variants else None


    def get_eq_variants_for_wasm(self, wasm_key):
        variants = self.connection.get(f"{wasm_key.decode()}")
        return json.loads(variants.decode()) if variants else None

    def get_eq_variants_for_wat(self, wat_key):
        variants = self.connection.get(f"{wat_key.decode()}")
        return json.loads(variants.decode()) if variants else None

    def get_unique_wasm(self, program):
        wasm_keys = self.connection.keys(f"{program}:wasm:*")
        return wasm_keys

    def get_unique_wat(self, program):
        wat_keys = self.connection.keys(f"{program}:wat:*")
        return wat_keys

    def get_total_llvm(self, program):
        C = 0
        for bc in self.get_unique_bitcodes(program):
            C += len(self.get_eq_variants_for_bc(bc))
        return C

    def get_total_wasm(self, program):
        C = 0
        for bc in self.get_unique_wasm(program):
            C += len(self.get_eq_variants_for_wasm(bc))
        return C

    def get_total_wat(self, program):
        C = 0
        for bc in self.get_unique_wat(program):
            C += len(self.get_eq_variants_for_wat(bc))
        return C

    def deploy_dash(self, debug=True):

        def plot_general_stats():

            programs = list(self.get_all_programs().keys())

            x = programs
            y = [ len(self.get_unique_bitcodes(p)) for p in programs]
            t = [ self.get_total_llvm(p) for p in programs]

            return dcc.Graph(
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


        def generate_report_for_module(module):

            unique_llvm = len(self.get_unique_bitcodes(module))
            unique_wasm = len(self.get_unique_wasm(module))
            unique_wat = len(self.get_unique_wat(module))

            total_llvm = self.get_total_llvm(module)
            total_wasm = self.get_total_wasm(module)
            total_wat = self.get_total_wat(module)


            return html.Div(
                children=html.Div(
                    children=[
                        html.H2(
                            children=[
                                html.A(
                                    className="btn btn-primary",
                                    children="Download original bitcode (TODO)",
                                    style={
                                        'marginRight': '50px'
                                    }
                                ),

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
                                )
                                ,
                                html.H4(
                                    className="col",
                                    children=f"Unique WASM {unique_wasm}/{total_wasm} ({unique_wasm/total_wasm*100:.2f}%)"
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

        app = dash.Dash(external_stylesheets=[dbc.themes.LUX])
        programs = self.get_all_programs()
        colors = {
            'background': '#FFFFFF',
            'text': '#000000'
        }
        app.layout = html.Div(style={'backgroundColor': colors['background']}, children=[
            html.Div(
                children=[
                    html.H1(
                        children='CROW dashboard'
                    ),
                    html.H2(
                        children=f"DB {self.redis_db}"
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


        app.run_server(debug=debug)

    def print_general_stats(self):
        programs = self.get_all_programs()

        for k in programs.keys():

            print(k)
            bc_unique = self.get_unique_bitcodes(k)
            print(f"\t bitcodes {len(bc_unique)}")


            for bc in bc_unique:
                variants = self.get_eq_variants_for_bc(bc)
                print(f"\t\teq {len(variants)}")


            w_unique = self.get_unique_wasm(k)
            print(f"\t wasm {len(w_unique)}")

            wt_unique = self.get_unique_wat(k)
            print(f"\t wat {len(wt_unique)}")

if __name__ == "__main__":

    m = Monitor(
        sys.argv[1],
        int(sys.argv[2]),
        sys.argv[3],
        sys.argv[4]
    )

    m.deploy_dash()
    #subscriber = Subscriber(1, MONITOR_QUEUE_NAME, GENERATED_BC_KEY, config["event"].getint("port"), general_log)
    #subscriber.setup()