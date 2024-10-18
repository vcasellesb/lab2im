FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get install -yqq git \
    pkg-config libhdf5-dev

RUN apt-get install python3.8 python3-pip -y    
RUN pip install --upgrade pip setuptools wheel

RUN git clone https://github.com/vcasellesb/lab2im.git && \
    cd lab2im && pip3 install -e .

ENTRYPOINT [ "python3", "-m", "lab2im.image_generator"]