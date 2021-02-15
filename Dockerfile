FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev awscli jq pigz \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/* \
  && python -m pip install --upgrade awscli

RUN python -m pip install boto3 pandas pysam

RUN aws --version

WORKDIR /opt/