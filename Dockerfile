# CentOS 7 + AppDynamics controller

FROM andrefernandes/docker-centos7-base

MAINTAINER Andre Fernandes

# Attempt to dockerize appdynamics controller

WORKDIR /opt

RUN groupadd -r appduser && useradd -r -g appduser appduser

RUN wget http://172.15.42.1/controller_64bit_linux-3.9.2.3.zip -q -O controller.zip && \
    unzip controller.zip && \
    rm controller.zip && \
    yum install libaio -y %% \
    yum clean all

ADD response.varfile /opt/response.varfile

RUN chmod +x controller*.sh && \
    ./controller_64bit_linux-3.9.2.3.sh -q -varfile response.varfile

