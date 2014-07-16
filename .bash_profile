DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/.aliases"
source "$DIR/.bash_prompt"

if [ "$(uname)" == "Darwin" ]; then
    source "$DIR/.alises_osx"
elif [ "$(uname)" == "Linux" ]; then
    source "$DIR/.alises_linux"
fi
