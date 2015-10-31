#!/bin/zsh

# vim Configuration
rm -rf ~/.vim
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# bin stuff
rm -rf ~/bin
ln -sf ~/dotfiles/bin ~/bin
