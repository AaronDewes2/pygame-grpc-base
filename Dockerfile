FROM python:3.7-slim

WORKDIR /

RUN apt-get update

RUN pip3 install googleapis-common-protos

RUN apt-get install -y git gcc g++ make  && \
  git clone https://github.com/AaronDewes/grpc.git -b arm64-boringssl --depth=1 --recursive  && \
  cd grpc && \
  pip3 install -r requirements.txt  && \
  python3 setup.py build -j$(nproc) && \
  python3 setup.py install && \
  apt-get remove -y git gcc g++ make -y && \
  apt-get autoremove -y && \
  apt-get clean && \
  cd .. && rm -rf grpc

CMD ["python3", "--version"]
