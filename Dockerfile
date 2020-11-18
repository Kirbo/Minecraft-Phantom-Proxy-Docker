FROM alpine:latest

RUN apk add --no-cache bash

WORKDIR /app

ARG PHANTOM_VERSION=0.5.2

ADD entrypoint.sh .

RUN wget https://github.com/jhead/phantom/releases/download/v${PHANTOM_VERSION}/phantom-linux-x86
RUN wget https://github.com/jhead/phantom/releases/download/v${PHANTOM_VERSION}/phantom-linux-x64
RUN wget https://github.com/jhead/phantom/releases/download/v${PHANTOM_VERSION}/phantom-linux-arm8

RUN chmod +x phantom-linux

RUN chmod +x entrypoint.sh

ENV SERVER unknown

EXPOSE 19132/udp

ENTRYPOINT ["/app/entrypoint.sh"]
