#!/bin/bash

docker build -t kirbownz/phantom-docker:latest .
docker push kirbownz/phantom-docker:latest
docker-compose up
