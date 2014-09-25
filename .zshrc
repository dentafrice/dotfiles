#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# setup OSes
if [[ $(uname) = 'Linux' ]]; then
    IS_LINUX=1
fi

if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
fi

# setup fasd
if which fasd >/dev/null; then
    eval "$(fasd --init auto)"
fi

# setup custom stuff
for f in "$HOME"/dotfiles/inc/zsh/*.zsh; do source $f; done
for f in "$HOME"/dotfiles/inc/theme/*.zsh; do source $f; done
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export UBER_HOME="$HOME/Uber"
export VAGRANT_DEFAULT_PROVIDER=aws
