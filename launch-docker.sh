#!/bin/sh

set -xe 

# builds docker image for dotfiles
docker build . -t dotfiles

# runs docker with standard
docker run -it \
  -u daplay \
  -v $(pwd)/home/daplay:/home/daplay \
  -v $WORKSPACE:/home/daplay/workspace \
  dotfiles \
  bash

