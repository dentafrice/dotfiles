#!/bin/zsh
setopt EXTENDED_GLOB

if [ ! -L "$HOME/.zprezto" ]; then
    ln -sf "${ZDOTDIR:-$HOME}/dotfiles/.zprezto" "$HOME/.zprezto"
fi

# for rcfile in "${ZDOTDIR:-$HOME}"/dotfiles/.zprezto/runcoms/^README.md(.N); do
#     cp "$rcfile" "${ZDOTDIR:-$HOME}/dotfiles/.${rcfile:t}"
#     ln -sf "${ZDOTDIR:-$HOME}/dotfiles/.${rcfile:t}" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done
