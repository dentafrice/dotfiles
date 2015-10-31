#!/bin/zsh

# vim Configuration
rm -rf ~/.vim
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# tmuxinator Configuration
rm -rf ~/.pymuxinator
rm -rf ~/.tmuxinator
ln -sf ~/dotfiles/.pymuxinator ~/.pymuxinator
ln -sf ~/dotfiles/.pymuxinator ~/.tmuxinator

# git Configuration
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# ack configuration
ln -sf ~/dotfiles/.ackrc ~/.ackrc

# x
ln -sf ~/dotfiles/.xinitrc ~/.xinitrc
ln -sf ~/dotfiles/.Xmodmap ~/.Xmodmap

# i3
rm -rf ~/.i3
ln -sf ~/dotfiles/.i3 ~/.i3

ln -sf ~/dotfiles/.i3/.i3status.conf ~/.i3status.conf

# bin stuff
rm -rf ~/bin
ln -sf ~/dotfiles/bin ~/bin

# dunst
mkdir -p ~/.config/dunst
ln -sf ~/dotfiles/dunstrc ~/.config/dunst/dunstrc
