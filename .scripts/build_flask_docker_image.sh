#! /bin/bash
set -eo pipefail

#
# Build docker image
#
echo "Building Flask App docker image..."
cd ../flask_app
docker_repo_image="brendalfly/hanzo_flask_app"
docker build -t "$docker_repo_image:latest" .