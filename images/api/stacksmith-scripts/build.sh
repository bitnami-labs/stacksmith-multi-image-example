#!/bin/bash

set -eu -o pipefail

export PATH=/root/.rbenv/bin:/root/.rbenv/shims:$PATH

yum install -y mysql-devel which unzip \
  git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

mkdir -p /opt/app
cd /opt/app

# generate build identifier
date "+%Y-%m-%d %H:%M:%S" >.build.date
cat $(find app config -type f | sort) | sha256sum - | awk '{ print $1 }' >.build.id

unzip "${UPLOADS_DIR}/*.zip"

ruby_version=$(cat .ruby-version|sed 's,^.*-,,')

if [ ! -d "/root/.rbenv/versions/${ruby_version}" ] ; then
  rbenv install "${ruby_version}"
fi

gem install bundler
bundle install --without="development test"
