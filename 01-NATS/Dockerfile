FROM ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y iputils-ping netcat-openbsd dnsutils net-tools iproute2
RUN apt-get install -y wget unzip

RUN apt-get install -y pip
RUN apt-get install -y python3.8-venv
RUN pip install zstd asyncio-nats-client

RUN cd /tmp; wget https://github.com/nats-io/nats-server/releases/download/v2.3.3/nats-server-v2.3.3-amd64.deb
RUN cd /tmp; dpkg -i nats-server-v2.3.3-amd64.deb

RUN cd /tmp; wget https://github.com/nats-io/natscli/releases/download/0.0.25/nats-0.0.25-amd64.deb
RUN cd /tmp; dpkg -i nats-0.0.25-amd64.deb

CMD ["nats-server", "--js", "-D", "-V"]
