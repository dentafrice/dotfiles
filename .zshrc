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
if [[ $IS_MAC -eq 1 ]]; then    
    plugins=(virtualenvwrapper $plugins)
fi

# Load OMZ
source $ZSH/oh-my-zsh.sh
source $DOTFILES/inc/zsh/rprompt.zsh # needs to happen after the theme
