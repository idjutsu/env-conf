rm -rf ~/bin/
rm -rf ~/.config/nvim/
rm -rf ~/envconf/
rm ~/.tmux.conf

git clone https://github.com/id-shogun/envconf.git

cp -r ~/envconf/nvim/structures/njojcntx/ ~/.config/nvim/
cp -r ~/envconf/shell-script/4fu8vpjh/ ~/bin/
cp ~/envconf/tmux/yhk8tni8 ~/.tmux.conf
