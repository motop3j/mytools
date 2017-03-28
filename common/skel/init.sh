#!/bin/bash

cd "$(dirname $0)"
dir="$(pwd)"
ln -s "$dir/vim" $HOME/.vim
ln -s "$dir/vimrc" $HOME/.vimrc
ln -s "$dir/zshrc" $HOME/.zshrc

