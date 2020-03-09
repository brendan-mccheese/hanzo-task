#!/bin/bash
set +e

exit=0

if [ -v "$CYPRESS_APP_URL" ]; then
    echo "$CYPRESS_APP_URL is a required environment variable"
    exit=1
fi

if [ -v "$CYPRESS_API_URL" ]; then
  echo "$CYPRESS_API_URL is a required environment variable"
  exit=1
fi

if [ "$exit" = "1" ]; then
  exit 1;
fi

count=0
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' "$CYPRESS_APP_URL")" != "200" ]]; do
  echo "Waiting for app to be up at $CYPRESS_APP_URL ..."
  sleep 5;
  count=$((count + 1))
  if [ $count == 10 ]; then
    echo "App never came up after 10 attempts, aborting"
    exit 10;
  fi
done

count=0
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' "$CYPRESS_API_URL")" != "200" ]]; do
  echo "Waiting for api to be up at $CYPRESS_API_URL..."
  sleep 5;
  count=$((count + 1))
  if [ $count == 10 ]; then
    echo "API never came up after 10 attempts, aborting"
    exit 10;
  fi
done

yarn run-tests:ci