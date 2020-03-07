#! /bin/bash

set -eo pipefail

mkdir -p ../.image_cache
docker_repo_image="brendalfly/hanzo_react_app"
docker save -o ../.image_cache/react_app.tar "$docker_repo_image:latest"
