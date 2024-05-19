#!/bin/bash

rm -rf *
ls -a | grep -v -E ".|..|.env" | xargs rm -rf

source .env

git clone https://github.com/id-shogun/env-conf.git

cp ./env-conf/compose.yaml ./compose.yaml
cp ./env-conf/Dockerfile ./Dockerfile
cp -r ./env-conf/nvim/ ./nvim/
cp ./env-conf/.tmux.conf ./tmux.conf
