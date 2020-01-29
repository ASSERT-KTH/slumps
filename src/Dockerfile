FROM slumps:backend


RUN apt-get update \
    && apt-get -y install python3.7 python3-pip

RUN python3.7 -m pip install pip

COPY . /slumps/src
COPY start_docker.sh /slumps/src



WORKDIR /slumps/src

RUN python3.7 -m pip install -r requirements.txt
RUN rm settings/.slumps

EXPOSE 6379
ENV TIMEOUT 1800

ENTRYPOINT ["./start_docker.sh"]