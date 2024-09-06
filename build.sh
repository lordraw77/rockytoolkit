#!/bin/bash

#rockytoolkit

tag=rockytoolkit
minver=0
maxver=1
dockerfilename=Dockerfile

docker build -f "$dockerfilename" . -t $tag:$maxver.$minver --no-cache --compress
docker tag $tag:$maxver.$minver $tag:latest
docker tag $tag:$maxver.$minver lordraw/$tag:$maxver.$minver
docker tag $tag:latest lordraw/$tag:latest
docker push lordraw/$tag:$maxver.$minver
docker push lordraw/$tag:latest