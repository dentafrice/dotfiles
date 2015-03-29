cd ~/dotfiles

echo ">> Updating dotfiles repo"
git pull

echo ">> Updating submodules"
git submodule update --init --recursive

# vim plugin configuration
vim +PluginInstall +qall
