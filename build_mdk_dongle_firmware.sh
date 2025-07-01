#!/bin/bash

IMAGE_NAME="logitacker-mdk"
CONTAINER_NAME="logitacker-mdk-container"
OUTPUT_DIR="$(pwd)/build"

# Build Docker image
docker build -f Dockerfile.mdk-dongle -t $IMAGE_NAME .

# Create a container and copy the firmware out
docker create --name $CONTAINER_NAME $IMAGE_NAME
mkdir -p "$OUTPUT_DIR"
docker cp $CONTAINER_NAME:/root/build "$OUTPUT_DIR"
docker rm $CONTAINER_NAME

echo "UF2 file located at: $OUTPUT_DIR/build/logitacker_mdk_dongle.uf2"
