#! /bin/bash

set -oe

if [ -n "$API_URL" ]; then
    echo "foo"
fi

#
# This is starting the dev server, for true production build the code
# would be bundled and served with something like nginx
#
yarn start