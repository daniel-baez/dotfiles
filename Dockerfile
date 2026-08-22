FROM ubuntu:24.04

LABEL maintainer="Daniel Baez"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=C.UTF-8

RUN apt-get update -q \
  && apt-get install -qqy \
    curl \
    git \
    jq \
    ripgrep \
    sudo \
    fzf \
    ca-certificates \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -ms /bin/bash daplay \
  && passwd -d daplay \
  && printf 'daplay ALL=(ALL) NOPASSWD:ALL\n' >> /etc/sudoers

USER daplay
WORKDIR /home/daplay

RUN mkdir -p workspace desktop
VOLUME /home/daplay/workspace
VOLUME /home/daplay/dotfiles

CMD ["/bin/bash"]
