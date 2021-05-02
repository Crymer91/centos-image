FROM centos:centos8
RUN dnf upgrade -y
# CIS-DI-0005
RUN export DOCKER_CONTENT_TRUST=1
# DKL-LI-0003
RUN rm -rf /tmp
# CIS-DI-0006
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
# CIS-DI-0008
RUN chmod u-s usr/sbin/unix_chkpwd
# CIS-DI-0001
RUN groupadd centos && adduser centos -g centos
USER centos