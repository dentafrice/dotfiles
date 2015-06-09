# Dotfiles
function push_dotfiles() {
    pushd ~/dotfiles
    git push origin master
    popd
}

function update_dotfiles() {
    pushd ~/dotfiles
    ./update.sh
    popd
}

# Git
function fga() {
    git add $(git status --porcelain | grep -v '^D ' | awk '{print $2}' | uniq | sort -r | fzf -m --query="$1" --exit-0)
}

# uDeploy
function ur() {
    uds --no-haproxy stop $1
    uds --no-haproxy start $1
}

# VirtualEnvs
function activate() {
    source ./$1/bin/activate
}
