#!/bin/bash
set -euxo pipefail

# Install Docker (Amazon Linux 2023)
dnf -y update
dnf -y install docker

systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user || true

# Run the container
docker rm -f minecraft || true
docker pull ${docker_image}

docker run -d \
  --name minecraft \
  -p ${server_port}:${server_port} \
  --restart unless-stopped \
  ${docker_image}
