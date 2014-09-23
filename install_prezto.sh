#!/bin/zsh
setopt EXTENDED_GLOB

ln -sf ~/dotfiles/.zprezto ~/.zprezto

for rcfile in "${ZDOTDIR:-$HOME}"/dotfiles/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
