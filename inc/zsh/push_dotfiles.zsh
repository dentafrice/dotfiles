function push_dotfiles() {
    pushd ~/dotfiles
    git push origin master
    popd
}
