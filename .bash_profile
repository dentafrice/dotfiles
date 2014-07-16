DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/.aliases"
source "$DIR/.bash_prompt"

if [ "$(uname)" == "Darwin" ]; then
    source "$DIR/.alises_osx"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    source "$DIR/.alises_linux"
fi
