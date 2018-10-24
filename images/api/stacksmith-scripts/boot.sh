#!/bin/bash

set -eu -o pipefail

cd /opt/app

export PATH=/root/.rbenv/bin:/root/.rbenv/shims:$PATH

# calculate and store SECRET_KEY_BASE
export SECRET_KEY_BASE=$(echo "${DATABASE_USER}:${DATABASE_HOST}:${DATABASE_NAME}" | sha256sum | awk '{ print $1 }')
touch .secret_key_base
chmod 0600 .secret_key_base
echo "${SECRET_KEY_BASE}" >.secret_key_base

cat >config/database.yml <<EOF
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: "${DATABASE_USER}"
  password: "${DATABASE_PASSWORD}"
  host: "${DATABASE_HOST}"
  database: "${DATABASE_NAME}"

development:
  <<: *default

test:
  <<: *default

production:
  <<: *default
EOF

# initialize database
RAILS_ENV=production bundle exec rake db:migrate db:sample_data
