FROM ubuntu:18.04

LABEL maintainer="Daniel Baez"

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL C.UTF-8

# Tools included in the container (debugging, yay!)
RUN apt-get update -q \
      && apt-get install -qqy \
        git \
        man \
        software-properties-common \
        silversearcher-ag \
        tmux \
        neovim

RUN apt-get update -q \
      && apt-get install -qqy \
        sudo

RUN apt-get update -q \
      && apt-get install -qqy \
        fish

# Creates user
RUN useradd -ms /usr/bin/fish daplay
# makes the user password-free?
RUN passwd -d daplay 
# sudo without 
RUN printf 'daplay ALL=(ALL) ALL\n' | tee -a /etc/sudoers 

# CLEANUP
RUN apt-get clean && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Cambia al nuevo usuario
USER daplay
WORKDIR /home/daplay

# creates workspace mountpoint
RUN mkdir -p workspace
VOLUME /home/daplay/workspace

# clones dotfiles (this) repo
RUN git clone https://github.com/daplay/dotfiles
VOLUME /home/daplay/dotfiles

# creates Desktop mountpoint
RUN mkdir -p desktop
VOLUME /home/daplay/desktop

CMD ["/usr/bin/fish"]

