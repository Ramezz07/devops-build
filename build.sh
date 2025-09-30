#!/bin/bash

IMAGE_NAME="myproj"
Tag="latest"

docker build -t $IMAGE_NAME:$Tag .

echo "Docker image build complete: $IMAGE_NAME:$Tag"

