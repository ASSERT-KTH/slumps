# slumps backend
FROM jacarte/slumps:deps

RUN cd souper \
    && mkdir build && cd build \
    && cmake ../ \
    && make -j8