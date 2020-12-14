# Containerized rockpm-server

## Docker build
```
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
```

## rockPM & Scouter Server Using Openshift
```
oc new-app -f openshift-rockpm-template.yaml
```

## Sample Spring-boot Using scouter-agent
EDIT Demo Application 
```
$ git clone https://github.com/nationminu/demo.git 
$ vi demo/rockpm/scouter.conf

## EDIT Scouter Server : {service_name}.{project_name}.svc.cluster.local 
net_collector_ip=scouter-server.rockpm.svc.cluster.local 
net_collector_udp_port=6100
net_collector_tcp_port=6100
```

```
$ vi openjdk-spring-boot-template.yaml
      spec:
        containers:
        - env:
          - name: JAVA_OPTIONS
            value: -Dscouter.config=/deployments/rockpm/scouter.conf -javaagent:/deployments/rockpm/scouter.agent.jar
          image: ${APPLICATION_NAME}
          
$ oc new-app -f openjdk-spring-boot-template.yaml
```