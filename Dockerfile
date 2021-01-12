FROM python:3.7-slim
WORKDIR /code

RUN apt-get update
RUN apt-get install -y python3-pip
# pygame build deps
RUN apt-get install -y libsdl2-dev libsdl2-mixer-dev libsdl2-image-dev libsdl2-ttf-dev libfreetype6-dev libjpeg-dev libportmidi-dev

RUN pip3 install pypng pygame pyqrcode python-bitcoinrpc googleapis-common-protos grpcio

RUN pip3 install grpcio-tools

