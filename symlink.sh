#!/bin/zsh

# vim Configuration
rm -rf ~/.vim
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# mutt configuration
rm -rf ~/.mutt
ln -sf ~/dotfiles/.mutt ~/.mutt
ln -sf ~/dotfiles/.muttrc ~/.muttrc

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

# other
ln -sf ~/dotfiles/.slate ~/.slate
