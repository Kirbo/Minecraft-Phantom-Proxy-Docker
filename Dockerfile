FROM alpine:latest

RUN apk add --no-cache bash

WORKDIR /app

ARG PHANTOM_VERSION=0.5.2

ADD entrypoint.sh .

RUN wget https://github.com/jhead/phantom/releases/download/v${PHANTOM_VERSION}/phantom-linux-x86 \
 && wget https://github.com/jhead/phantom/releases/download/v${PHANTOM_VERSION}/phantom-linux-x64 \
 && wget https://github.com/jhead/phantom/releases/download/v${PHANTOM_VERSION}/phantom-linux-arm5 \
 && wget https://github.com/jhead/phantom/releases/download/v${PHANTOM_VERSION}/phantom-linux-arm6 \
 && wget https://github.com/jhead/phantom/releases/download/v${PHANTOM_VERSION}/phantom-linux-arm7 \
 && wget https://github.com/jhead/phantom/releases/download/v${PHANTOM_VERSION}/phantom-linux-arm8 \
 && chmod +x phantom-linux* \
 && chmod +x entrypoint.sh

ENV SERVER unknown

EXPOSE 19132/udp

ENTRYPOINT ["/app/entrypoint.sh"]
