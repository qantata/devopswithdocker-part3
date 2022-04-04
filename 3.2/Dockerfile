FROM ubuntu:20.04

WORKDIR /usr/src/app

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y git && \
  apt-get install docker.io -y

COPY ./script.sh .

RUN chmod +x ./script.sh

ENTRYPOINT ["./script.sh"]