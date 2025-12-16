#!/usr/bin/env bash
set -e

echo "Running Dockerfile unit tests..."

# Test 1: Dockerfile exists
echo "Checking Dockerfile exists..."
test -f Dockerfile

# Test 2: Correct base image
echo "Checking base image..."
grep -q "^FROM itzg/minecraft-server" Dockerfile

# Test 3: Required ENV variables are defined
echo "Checking ENV variables..."
grep -q "EULA=TRUE" Dockerfile
grep -q "TYPE=PAPER" Dockerfile
grep -q "MEMORY=2G" Dockerfile

# Test 4: Required directories are created
echo "Checking required directories..."
grep -q "mkdir -p /data /startup" Dockerfile

# Test 5: Minecraft port exposed
echo "Checking exposed port..."
grep -q "^EXPOSE 25565" Dockerfile

# Test 6: No required COPY instructions are active
# (Ensures build will not fail due to missing files)
echo "Checking COPY instructions are commented out..."
! grep -q "^COPY server.properties" Dockerfile
! grep -q "^COPY whitelist.json" Dockerfile
! grep -q "^COPY ops.json" Dockerfile

echo "All Dockerfile unit tests passed!"
