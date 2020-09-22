FROM slumps/backend:latest AS builder

env DEBIAN_FRONTEND=noninteractive

RUN echo "Installing packages"

RUN apt-get update \
    && apt-get -y install wget tar llvm\
    && rm -rf /var/lib/apt/lists/*


COPY superopt.sh /slumps/superoptimizer/superopt.sh

WORKDIR /slumps/superoptimizer
ENV WASI True

RUN mkdir -p /usr/src/souper/third_party
RUN cp -r /slumps/souper/third_party/z3-install /usr/src/souper/third_party/
ENTRYPOINT ["./superopt.sh"]