FROM jacarte/slumps:deps.2


RUN apt-get update \
    && apt-get -y install python3.7 python3-pip wget

RUN python3.7 -m pip install pip

COPY . /slumps/src
COPY start_docker.sh /slumps/src



WORKDIR /slumps/src

RUN python3.7 -m pip install -r requirements.txt
RUN rm settings/.slumps
RUN rm -rf out && mkdir out
RUN rm -rf logs && mkdir logs
RUN rm -rf .idea
RUN rm -rf tests
RUN rm -rf .pytest_cache

EXPOSE 6379
ENV TIMEOUT 1800

ENV TOUSER 1800
ENV GUSER 1800
ENV GPASS 1800

ENV GITHUB_USER 1800
ENV GITHUB_TOKEN 1800
ENV REPO_NAME 1800

ENTRYPOINT ["./start_docker.sh"]