#!/bin/bash

set -e

export IMAGE_NAME="myproj:latest"
export CONTAINER_NAME="myproject"

echo "Starting deployment with Docker Compose..."
docker-compose down
docker-compose up -d


