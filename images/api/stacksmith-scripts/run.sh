#!/bin/bash

set -eu -o pipefail

export PATH=/root/.rbenv/bin:/root/.rbenv/shims:$PATH

cd /opt/app
cat config/database.yml

touch log/production.log
tail -f log/production.log &
export SECRET_KEY_BASE=$(cat .secret_key_base)
bundle exec rails server -e production -p 8080
