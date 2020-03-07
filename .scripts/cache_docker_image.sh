#! /bin/bash

set -eo pipefail

mkdir -p ../.image_cache
docker_repo_image="brendalfly/hanzo_flask_app"
docker save -o ../.image_cache/flask_app.tar "$docker_repo_image:latest"
