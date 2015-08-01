#!/bin/zsh

pushd ~/dotfiles

git submodule update --init --recursive

. symlink.sh
. install_prezto.sh
git reset --hard

popd
