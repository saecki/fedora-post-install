#!/bin/bash

install()  {
    curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

update() {
    echo "Run PlugUpgrade from within vim to update vim-plug"
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

