export DOTFILES=$HOME/dotfiles
export ZSH=$DOTFILES/oh-my-zsh

ZSH_THEME="avit"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/.aliases

if [ `uname` = "Darwin" ]; then
    # Custom OSX Source
elif [ `uname` = "Linux" ]; then
    source "$DOTFILES/.ssh_auth"
    source "$DOTFILES/.aliases_linux"
fi

