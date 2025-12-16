#!/usr/bin/env bash
set -e

CONTAINER_NAME=minecraft-integration-test
IMAGE_NAME=minecraft-server-2:latest

echo "Starting integration test container..."

# Run the container in detached mode
docker run -d \
  --name $CONTAINER_NAME \
  -e EULA=TRUE \
  -p 25565:25565 \
  $IMAGE_NAME

echo "Waiting for Minecraft server to start..."
sleep 40

echo "Checking container is running..."
docker ps | grep $CONTAINER_NAME

echo "Checking logs for successful startup..."
docker logs $CONTAINER_NAME | grep -q "Done"

echo "Checking port 25565 is open..."
nc -z localhost 25565

echo "Integration test passed!"
