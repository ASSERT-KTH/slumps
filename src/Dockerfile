FROM slumps:backend


RUN apt-get update \
    && apt-get -y install python3-pip

COPY . /slumps/src
COPY start_docker.sh /slumps/src


WORKDIR /slumps/src

RUN pip3 install -r requirements.txt
RUN rm settings/.slumps

EXPOSE 6379

ENTRYPOINT ["./start_docker.sh"]