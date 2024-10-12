#!/usr/bin/bash

set -x

xhost +local:root

docker run --name oracle \
    -p 1521:1521 \
    --env ORACLE_PWD=Renatus123 \
    --env DISPLAY=$DISPLAY \
    --volume /home/renat/.big-files/oracle/oradata:/opt/oracle/oradata \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    container-registry.oracle.com/database/free:latest
