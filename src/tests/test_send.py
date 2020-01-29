import re
import os
import utils

BASEDIR = os.path.dirname(__file__)


def test_email():
    utils.sendReportEmail("Test report", "Report attached", ["%s/test_re.c"%BASEDIR])