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

# Load only OSX things
if [[ $IS_MAC -eq 1 ]]; then    
    plugins=(virtualenvwrapper $plugins)
    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
fi

# Load OMZ
source $ZSH/oh-my-zsh.sh
source $DOTFILES/inc/zsh/rprompt.zsh # needs to happen after the theme

# Load autojump
