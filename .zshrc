export DOTFILES=$HOME/dotfiles
export ZSH=$DOTFILES/oh-my-zsh

ZSH_THEME="avit"

plugins=(git virtualenv)

source $DOTFILES/.aliases

if [ `uname` = "Darwin" ]; then
    # Custom OSX Source
    plugins=(virtualenvwrapper $plugins)
elif [ `uname` = "Linux" ]; then
    source "$DOTFILES/.ssh_auth"
    source "$DOTFILES/.aliases_linux"
fi

source $ZSH/oh-my-zsh.sh

for inc_file ($DOTFILES/inc/*.all.sh); do
    source $inc_file
done

