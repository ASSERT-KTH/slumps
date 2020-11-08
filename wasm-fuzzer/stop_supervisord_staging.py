import sys
import os
import signal

"""
This script is to ensure that supervisord gets killed when either AFL or SWAM crashes.
This makes it easier to determine whether WAFL was successful in a CI.

All write_stdout calls are standard protocol between the event listener and supervisord.
"""

def write_stdout(s):
    # only eventlistener protocol messages may be sent to stdout
    sys.stdout.write(s)
    sys.stdout.flush()

def write_stderr(s):
    sys.stderr.write("\n>>> Event listener here (stderr) >>> " + s + "\n")
    sys.stderr.flush()

def main():
    while 1:
        # transition from ACKNOWLEDGED to READY
        write_stdout('READY\n')

        # read header line and print it to stderr
        line = sys.stdin.readline()
        # line = ver:3.0 server:supervisor serial:0 pool:processes poolserial:0 eventname:PROCESS_STATE_EXITED len:80
        write_stderr(line)

        # read event payload and print it to stderr
        headers_dict = dict([ x.split(':') for x in line.split() ])
        # headers_dict = {'ver': '3.0', 'server': 'supervisor', 'serial': '0', 'pool': 'processes', 'poolserial': '0', 'eventname': 'PROCESS_STATE_EXITED', 'len': '80'}
        data = sys.stdin.read(int(headers_dict['len']))  # (payload body)
        # data = processname:afl_client groupname:afl_client from_state:RUNNING expected:0 pid:44
        write_stderr(data)

        # 'pid' represents the UNIX process id of the process that exited. 
        # 'expected' represents whether the process exited with an expected exit 
        # code or not. It will be 0 if the exit code was unexpected, or 1 if the exit code was expected.
        data_dict = dict([ x.split(':') for x in data.split() ])
        if data_dict['expected'] == "1":
            write_stderr('Expected exit. All good!')
            write_stdout('RESULT 2\nOK')
            continue

        pidfile = open('/var/run/supervisord.pid','r')
        pid = int(pidfile.readline())
        write_stderr('Received unexpected exit. Killing supervisor pid: ' + str(pid))
        try:
            os.kill(pid, signal.SIGTERM)
        except Exception as e:
            write_stderr('Could not kill supervisor: ' + str(e))

        # transition from READY to ACKNOWLEDGED
        write_stdout('RESULT 2\nOK')

if __name__ == '__main__':
    main()