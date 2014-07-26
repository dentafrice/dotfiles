export DOTFILES=$HOME/dotfiles
export ZSH=$DOTFILES/oh-my-zsh

ZSH_THEME="avit"

plugins=(git virtualenv)

# Load virtualenvwrapper only on OSX
if [ `uname` = "Darwin" ]; then
    plugins=(virtualenvwrapper $plugins)
fi

# Load OMZ
source $ZSH/oh-my-zsh.sh

# Load all includes
for inc_file ($DOTFILES/inc/all/*); do
    source $inc_file
done

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

