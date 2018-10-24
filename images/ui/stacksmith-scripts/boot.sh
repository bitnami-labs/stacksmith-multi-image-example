#!/bin/bash

set -eu -o pipefail

sed "s/{{ api_endpoint }}/${API_ENDPOINT}/" \
  </etc/nginx/nginx.conf.template \
  >/etc/nginx/nginx.conf

echo "Config:"
echo " --- "
cat /etc/nginx/nginx.conf
echo " --- "
