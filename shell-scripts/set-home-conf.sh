#!/bin/bash

rm -rf ~/.config/nvim/
rm ~/.tmux.conf
rm -rf ~/bin/
rm -rf ~/env-conf/

git clone https://github.com/id-shogun/env-conf.git

cp ~/env-conf/.tmux.conf ~/.tmux.conf
cp -r ~/env-conf/shell-scripts/ ~/bin/
cp -r ~/env-conf/nvim/ ~/.config/nvim/
