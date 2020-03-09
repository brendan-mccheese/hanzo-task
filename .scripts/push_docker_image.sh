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

# Parse command line args
while (( "$#" )); do
  case "$1" in
    -b|--base-image)
      base_image=$2
      shift 2
      ;;
    -t|--target-image)
      target_image=$2
      shift 2
      ;;
    --) # end argument parsing
      shift
      break
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
  esac
done

if [[ -z "$base_image" ]]; then
    echo "Please specify base image!"
    exit 1
fi

if [[ -z "$target_image" ]]; then
    echo "Please specify target image!"
    exit 1
fi

# Login and push image
docker login --username $DOCKER_HUB_USER --password $DOCKER_HUB_PASSWORD
docker tag "$base_image" "$target_image"
docker push "$target_image"