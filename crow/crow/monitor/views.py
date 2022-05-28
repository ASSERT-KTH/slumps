from flask import render_template
from json import dumps
import os

PROTOCOL = os.environ.get("PROTOCOL", 'http')


def index():
    return render_template("index.html", PROTOCOL=PROTOCOL)

