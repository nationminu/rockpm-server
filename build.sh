#!/usr/bin/env bash

SCOUTER_VERSION=2.7.1

docker build -t docker.io/nationminu/scouter-server:${SCOUTER_VERSION} . -f Dockerfile.scouter
docker tag docker.io/nationminu/scouter-server:${SCOUTER_VERSION}  docker.io/nationminu/scouter-server:latest
docker push docker.io/nationminu/scouter-server:${SCOUTER_VERSION} 
docker push docker.io/nationminu/scouter-server:latest 

ROCKPM_VERSION=1.0.0

docker build -t docker.io/nationminu/rockpm-server:${ROCKPM_VERSION} . -f Dockerfile.rockpm
docker tag docker.io/nationminu/rockpm-server:${ROCKPM_VERSION}  docker.io/nationminu/rockpm-server:latest
docker push docker.io/nationminu/rockpm-server:${ROCKPM_VERSION} 
docker push docker.io/nationminu/rockpm-server:latest 
