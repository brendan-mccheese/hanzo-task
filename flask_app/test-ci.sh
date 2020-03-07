#! /bin/bash
set -eo pipefail

python3 -m xmlrunner api/simple_flask_app_test.py -o ./test_results