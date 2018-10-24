FROM centos:7

# install dependencies first to speed up development
RUN yum install -y mysql-devel which unzip \
  git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
RUN bash -c 'export PATH=/root/.rbenv/bin:/root/.rbenv/shims:$PATH && curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash && rbenv install 2.3.3'

# simulate Stacksmith build
ENV UPLOADS_DIR=/tmp
ADD app-api.zip /tmp/app-api.zip
ADD stacksmith-scripts/build.sh /build.sh
RUN chmod 0755 /build.sh
RUN /build.sh
ADD start.sh /start.sh
ADD stacksmith-scripts/boot.sh /boot.sh
ADD stacksmith-scripts/run.sh /run.sh
RUN chmod 0755 /start.sh /boot.sh /run.sh
ENTRYPOINT /start.sh
