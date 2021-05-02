FROM centos:centos8
RUN dnf upgrade -y
# DKL-LI-0003
RUN rm -rf /tmp
# CIS-DI-0006
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
# CIS-DI-0008
RUN chmod -r 1755 usr/sbin/*
RUN chmod -r 1755 usr/bin/*
RUN chmod -r 1711 usr/libexec/utempter/*
# CIS-DI-0001
RUN groupadd centos && adduser centos -g centos
USER centos