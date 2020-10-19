FROM ubuntu:20.04
env DEBIAN_FRONTEND=noninteractive

# We copy just the requirements.txt first to leverage Docker cache

RUN apt-get update && apt-get install -y openjdk-11-jdk python3-dev python3-pip python3.8

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN mkdir tmp

RUN pip3 install -r requirements.txt

COPY . /app

EXPOSE 8080

COPY swam.jar /swam.jar

ENV PORT 8080
ENV SWAM_BIN /swam.jar

RUN python3.8 --version

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "server:app"]