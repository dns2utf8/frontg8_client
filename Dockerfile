FROM ubuntu:trusty-20150427
MAINTAINER docker.frontg8_server@estada.ch

RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
  && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
  && apt-get update \
  && apt-get install -y git ca-certificates python3-pip python3-openssl \
  && apt-get install -y libprotobuf-dev protobuf-compiler python-protobuf \
  && pip3 install protobuf3 xmlrunner pycrypto pyelliptic pyOpenSSL npyscreen \
  && rm -rf /var/lib/apt/lists/* # 20150504

RUN cd /home \ 
  && git clone https://source.arknet.ch/frontg8/client.git