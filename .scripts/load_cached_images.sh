#! /bin/bash
set -eo pipefail

for file in ./../.image_cache/*; do
  echo "$file"
  time docker load < "$file"
done
