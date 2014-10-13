#!/bin/zsh

. ~/dotfiles/update.sh

# prezto install
# . ~/dotfiles/install_prezto.sh

# vim Configuration
rm -rf ~/.vim
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# tmux Configuration
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# tmuxinator Configuration
rm -rf ~/.pymuxinator
rm -rf ~/.tmuxinator
ln -sf ~/dotfiles/.pymuxinator ~/.pymuxinator
ln -sf ~/dotfiles/.pymuxinator ~/.tmuxinator

# git Configuration
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# ack configuration
ln -sf ~/dotfiles/.ackrc ~/.ackrc
