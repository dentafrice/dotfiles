export DOTFILES=$HOME/dotfiles
export ZSH=$DOTFILES/oh-my-zsh

if [[ $(uname) = 'Linux' ]]; then
    IS_LINUX=1
fi

if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
fi

ZSH_THEME="avit"
ZSH_CUSTOM="$DOTFILES/inc/zsh"

plugins=(git virtualenv)

# Load virtualenvwrapper only on OSX
if [ `uname` = "Darwin" ]; then
    plugins=(virtualenvwrapper $plugins)
fi

# Load OMZ
source $ZSH/oh-my-zsh.sh

# Load OSX Includes
if [ `uname` = "Darwin" ]; then
    if [ -d "$DOTFILES/inc/osx" ]; then
        for inc_file ($DOTFILES/inc/osx/*); do
            source $inc_file
        done
    fi
fi

# Load Linux Includes
if [ `uname` = "Linux" ]; then
    if [ -d "$DOTFILES/inc/linux" ]; then
        for inc_file ($DOTFILES/inc/linux/*); do
            source $inc_file
        done
    fi
fi

