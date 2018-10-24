#!/bin/bash

set -eu -o pipefail

for tier in api ui ; do
  cd "images/${tier}"
  ./create-app-zip.sh
  cd ../..
done

# create modified helm chart template for UI tier for uploading to Stacksmith
tar -C helm-charts/ui -czf ./helm-charts-ui.tgz .

