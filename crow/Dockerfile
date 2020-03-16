FROM jacarte/slumps:wasi


RUN apt-get update \
    && apt-get -y install python3.7 python3-pip wget

RUN python3.7 -m pip install pip

COPY . /slumps/crow
COPY start_docker.sh /slumps/crow



WORKDIR /slumps/crow

RUN python3.7 -m pip install -r requirements.txt
RUN rm settings/.slumps
RUN rm -rf out && mkdir out
RUN rm -rf logs && mkdir logs
RUN rm -rf .idea
RUN rm -rf tests
RUN rm -rf .pytest_cache


ENTRYPOINT ["./start_docker.sh"]