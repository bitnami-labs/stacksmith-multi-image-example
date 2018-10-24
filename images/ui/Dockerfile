FROM centos:7

# install dependencies first to speed up development
RUN yum install -y epel-release && yum update -y && yum install -y nginx

# simulate Stacksmith build
ENV UPLOADS_DIR=/tmp
ADD nginx.conf.template /tmp/nginx.conf.template
ADD app-ui.zip /tmp/app-ui.zip
ADD stacksmith-scripts/build.sh /build.sh
RUN chmod 0755 /build.sh
RUN /build.sh
ADD start.sh /start.sh
ADD stacksmith-scripts/boot.sh /boot.sh
ADD stacksmith-scripts/run.sh /run.sh
RUN chmod 0755 /start.sh /boot.sh /run.sh
ENTRYPOINT /start.sh
