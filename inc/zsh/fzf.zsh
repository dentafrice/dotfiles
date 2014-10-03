fga() {
    local files
    files=$(git ls-files --other --exclude-standard | fzf -m --query="$1" --exit-0)
    git add "$files"
}

fgv() {
    local files
    files=$(git ls-files --other --exclude-standard | fzf -m --query="$1" --exit-0)
    vim "$files"
}
