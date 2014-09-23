#!/bin/zsh
setopt EXTENDED_GLOB

ln -sf ~/dotfiles/.zprezto ~/.zprezto

for rcfile in "${ZDOTDIR:-$HOME}"/dotfiles/.zprezto/runcoms/^README.md(.N); do
    cp "$rcfile" "${ZDOTDIR:-$HOME}/dotfiles/.${rcfile:t}"
    ln -sf "${ZDOTDIR:-$HOME}/dotfiles/.${rcfile:t}" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
