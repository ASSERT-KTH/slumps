FROM slumps:backend

COPY /utils/pipeline/python/pipeline.sh /slumps


WORKDIR /slumps

ENV LANG C.UTF-8

ENV SRC_DIR /slumps
ENV WASM_LD /usr/bin/wasm-ld-8
ENV INPUT_FOLDER /input
ENV MAX_INST 3
ENV OPT1 O0
ENV OPT2 O0
ENV CHECK_OPTS ""
ENV FILE ""

ENTRYPOINT ["./pipeline.sh"]