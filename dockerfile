FROM centos:centos8
RUN dnf upgrade -y
# DKL-LI-0003
RUN rm -rf /tmp
# CIS-DI-0006
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
# CIS-DI-0008
RUN chmod -R 755 usr/sbin/*
RUN chmod -R 755 usr/bin/*
RUN chmod -R 711 usr/libexec/*
# CIS-DI-0001
RUN groupadd centos && adduser centos -g centos
USER centos