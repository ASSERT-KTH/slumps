FROM slumps:backend

RUN apt-get install -y python3-pip

COPY /utils/pipeline/python /slumps/python
COPY /run.sh /slumps/python/run.sh


WORKDIR /slumps/python

ENV LANG C.UTF-8

ENV SRC_DIR /slumps
ENV WASM_LD /usr/bin/wasm-ld-8
ENV INPUT_FOLDER /input
ENV MAX_INST 3
ENV OPT1 O0
ENV OPT2 O0
ENV CHECK_OPTS ""
ENV FILE ""


RUN pip3 install -r requirements.txt

ENTRYPOINT ["./run.sh"]