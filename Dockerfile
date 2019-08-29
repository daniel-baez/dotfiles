FROM archlinux/base:latest
LABEL maintainer="Daniel Baez"

# Instalación de paquetes básicos disponibles
# En los repositorios de Archlinux
RUN pacman --noconfirm -Syu neovim \
      sudo \
      ruby \
      python \
      xdg-utils \
      git \
      tmux \
      emacs \
      the_silver_searcher \
      man \
      base-devel \
      task \
      timew

# Crea my usuario
RUN useradd -ms /bin/bash daplay
# Remueve la password para el usuario `daplay`
RUN passwd -d daplay 
# Allow daplay passwordless sudo for `daplay`
RUN printf 'daplay ALL=(ALL) ALL\n' | tee -a /etc/sudoers 

# Cambia al nuevo usuario
USER daplay
WORKDIR /home/daplay

# Instala Yaourt una alternativa a pacman con un repositorio
# dirigido por la comunidad
RUN mkdir -p /home/daplay/sources && \
      cd /home/daplay/sources && \
      git clone https://aur.archlinux.org/package-query.git && \
      cd package-query && \
      makepkg -si --noconfirm && \
      cd .. && \
      git clone https://aur.archlinux.org/yaourt.git && \
      cd yaourt && \
      makepkg -si --noconfirm && \
      cd /home/daplay

# Instala neovim remote
RUN yaourt -Sy --noconfirm neovim-remote

# Crea mountpoints para `launch-docker.sh` otro archivo de este mismo repo
VOLUME /home/daplay
VOLUME /home/daplay/bin
VOLUME /home/daplay/workspace

# Borra los archivos de instalacion e indices luego de haber instalado todo
RUN sudo rm -f \
    /var/cache/pacman/pkg/* \
    /var/lib/pacman/sync/* \
    /etc/pacman.d/mirrorlist.pacnew

WORKDIR /home/daplay

CMD ["/bin/bash"]

