FROM mmmaxwwwell/nginx:latest
RUN \
  apt-get update &&\
  apt-get upgrade -y &&\
  apt-get install cargo -y &&\
  cargo install boringtun &&\
  mv /root/.cargo/bin/boringtun /bin/boringtun &&\
  rm -rf /root/.cargo &&\
  apt-get purge cargo -y &&\
  apt-get autoremove -y &&\
  echo 'export WG_QUICK_USERSPACE_IMPLEMENTATION=boringtun' > /etc/bash.bashrc
COPY ./scripts.d/* /docker-entrypoint.d/