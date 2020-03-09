#! /bin/bash
set -eo pipefail

#
# Build docker image
#
echo "Building React App docker image..."
cd ../react_frontend
docker_repo_image="brendalfly/hanzo_react_app"
docker build -t "$docker_repo_image:latest" .