DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/.aliases"
source "$DIR/.bash_prompt"

if [ "$(uname)" == "Darwin" ]; then
    source "$DIR/.aliases_osx"
elif [ "$(uname)" == "Linux" ]; then
    source "$DIR/.aliases_linux"
fi
