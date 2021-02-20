from crow.events import LOG_MESSAGE
from crow.monitor.logger import ERROR
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
import traceback
from crow.settings import config
from crow.monitor import MONITOR_QUEUE_NAME


def log_system_exception():

    def Inner(func):

        def wrapper(*args, **kwargs):

            try:
                r = func(*args, **kwargs)
                return r
            except Exception as e:
                trace = traceback.format_exc()
                p = Publisher()

                p.publish(message=dict(
                    event_type=LOG_MESSAGE,
                    exception=f"{e} {trace}",
                    severity=ERROR
                ),
                routing_key="")

        return wrapper

    return Inner

@subscriber_function(event_type="*")
def general_log(data):
    print(data["event_type"], data.get("program_name", data.get("message", "")))
    print("="*100)

if __name__ == "__main__":

    key = config["event"]["process-id-exploration"]
    subscriber = Subscriber(1, MONITOR_QUEUE_NAME, key, config["event"].getint("port"), general_log)
    subscriber.setup()