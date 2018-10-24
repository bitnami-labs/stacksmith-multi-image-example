#!/bin/bash

set -eu -o pipefail

yum install -y epel-release
yum update -y
yum install -y nginx unzip

cp ${UPLOADS_DIR}/nginx.conf.template /etc/nginx/nginx.conf.template

mkdir -p /opt/html
cd /opt/html
unzip ${UPLOADS_DIR}/*.zip
echo "{\"id\": \"$(sha256sum index.html | awk '{ print $1 }')\", \"date\": \"$(date '+%Y-%m-%d %H:%M:%S')\"}" >version.json
