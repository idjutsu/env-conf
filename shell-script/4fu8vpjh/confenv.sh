#!/bin/bash

rm -rf *
ls -a | grep -v -E ".|..|.env" | xargs rm -rf

source .env

git clone https://github.com/id-shogun/envconf.git

cp ./envconf/dockerfile/$DOCKER_FILE ./Dockerfile
cp ./envconf/docker-compose/$DOCKER_COMPOSE.yaml ./compose.yaml
cp -r ./envconf/nvim/structures/$NVIM_CONF/ ./nvim/
cp ./envconf/.tmux.conf ./tmux.conf
