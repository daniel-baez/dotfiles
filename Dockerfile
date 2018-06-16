FROM archimg/base:2018.04.01
LABEL maintainer="Daniel Baez"

RUN pacman --noconfirm -Syu \
        && rm -f \
        /var/cache/pacman/pkg/* \
        /var/lib/pacman/sync/* \
        /etc/pacman.d/mirrorlist.pacnew

RUN useradd -ms /bin/bash daplay
USER daplay
WORKDIR /home/daplay

RUN mkdir $HOME/bin \
        $HOME/.task \
        $HOME/vimwiki \
        $HOME/workspace

CMD ["/bin/bash"]
