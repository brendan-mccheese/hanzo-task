#! /bin/bash

set -eo pipefail

#
# Check environment variables
#
should_exit=0

if [[ -z "$DOCKER_HUB_USER" ]]; then
    echo "Please add DOCKER_HUB_USER to your environment"
    should_exit=1
fi

if [[ -z "$DOCKER_HUB_PASSWORD" ]]; then
    echo "Please add DOCKER_HUB_PASSWORD to your environment"
    should_exit=1
fi

if [[ "$should_exit" -eq 1 ]]; then
    echo "Missing environment variables, aborting..."
    exit 1
fi

docker login --username $DOCKER_HUB_USER --password $DOCKER_HUB_PASSWORD