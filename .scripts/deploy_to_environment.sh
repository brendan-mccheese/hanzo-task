#! /bin/bash

# Parse command line args
while (( "$#" )); do
  case "$1" in
    -e|--environment)
      environment=$2
      shift 2
      ;;
    -t|--tag)
      tag=$2
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

if [[ -z "$environment" ]]; then
    echo "Please specify target environment!"
    exit 1
fi

if [[ -z "$tag" ]]; then
    echo "Please specify image tag!"
    exit 1
fi

## Fake deploy
echo "Hold tight, deploying to $environment..."
echo "Triggering something on some remote to pull frontend image tagged $tag..."
echo "Now using image brendalfly/hanzo_react_app:$tag"
sleep 10
echo "Triggering something on some remote to pull backend image tagged $tag..."
echo "Now using image brendalfly/hanzo_flask_app:$tag"
sleep 10
echo "Deployed latest code to $environment!!!"
sleep 10