#!/bin/bash
#
# run-zeppelin-docker.sh - Run Zeppelin container in Docker
#
#                          To stop the container, type `docker stop zeppelin`.

# After running this script point your browser to
# http://localhost:8080
# If port 8080 is already taken by another program, change the PORT
# variable below to another port.
PORT=8080

pwd

# The name of the docker image on Docker Hub
#DOCKER_IMAGE_NAME=apache/zeppelin:0.7.3
#DOCKER_IMAGE_NAME=apache/zeppelin:0.8.1
#DOCKER_IMAGE_NAME=apache/zeppelin:0.8.2
#DOCKER_IMAGE_NAME=apache/zeppelin:0.9.0
#DOCKER_IMAGE_NAME=apache/zeppelin:0.10.0
#DOCKER_IMAGE_NAME=apache/zeppelin:0.10.1

# Build custom image based of apache/zeppelin:0.10.1
# This allow us to use the same spark version as with Google Dataproc
docker build -t bda-zeppelin . < Dockerfile
DOCKER_IMAGE_NAME=bda-zeppelin:latest

# Create directories for sharing data between the container and the
# host running the container.

mkdir -p logs      # Host directory for Zeppelin logs
mkdir -p notebooks # Host directory for Zeppelin notebooks
mkdir -p data      # Host directory for datasets

# For each shared directory we tell Docker to mount the directory
# inside the container with the -v option. We tell Zeppelin where the
# directories are by setting environment variables via the Docker -e
# option.

docker run \
       --name zeppelin \
       -p $PORT:8080 \
       --rm \
       -v "$PWD"/logs:/logs \
       -e ZEPPELIN_LOG_DIR='/logs' \
       -v "$PWD"/notebooks:/notebooks \
       -e ZEPPELIN_NOTEBOOK_DIR='/notebooks' \
       -e ZEPPELIN_INTP_MEM='-Xms1024m -Xmx4g -XX:MaxPermSize=4g'\
       -e ZEPPELIN_JAVA_OPTS='-Dspark.driver.memory=4g -Dspark.executor.memory=4g -Dspark.cores.max=2'\
       -v "$PWD"/data:/data \
       $DOCKER_IMAGE_NAME
