FROM slumps:backend

COPY /utils/pipeline/python/pipeline.sh /slumps


WORKDIR /slumps

ENV LANG C.UTF-8


ENV SRC_DIR /slumps
ENV WASM_LD /usr/bin/wasm-ld-8
ENV INPUT_FOLDER /input

ENTRYPOINT ["./pipeline.sh"]