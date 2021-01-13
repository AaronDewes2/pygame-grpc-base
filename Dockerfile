FROM python:3.7-slim

WORKDIR /

RUN apt-get update
# pygame build deps
RUN apt-get install -y libsdl2-dev libsdl2-mixer-dev libsdl2-image-dev libsdl2-ttf-dev libfreetype6-dev libjpeg-dev libportmidi-dev git gcc g++ make

RUN pip3 install pypng pygame pyqrcode python-bitcoinrpc googleapis-common-protos

RUN git clone https://github.com/AaronDewes/grpc.git -b arm64 --depth=1

WORKDIR /grpc

RUN git submodule init && git submodule update
RUN pip3 install -r requirements.txt
RUN echo "Building python grpc with $(nproc) jobs in 15 seconds" && sleep 5 && echo "======================"
RUN python3 setup.py build -j$(nproc) 
RUN python3 setup.py install
