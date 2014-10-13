#!/bin/zsh

. ~/dotfiles/update.sh

# prezto install
# . ~/dotfiles/install_prezto.sh

# vim Configuration
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# tmux Configuration
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# tmuxinator Configuration
ln -sf ~/dotfiles/.pymuxinator ~/.pymuxinator
ln -sf ~/dotfiles/.tmuxinator ~/.pymuxinator

# git Configuration
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# ack configuration
ln -sf ~/dotfiles/.ackrc ~/.ackrc
