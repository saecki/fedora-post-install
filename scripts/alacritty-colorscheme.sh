#!/bin/bash

src_path="$HOME/Projects/alacritty-colorscheme-rs"

compile() {
    (cd "$src_path" && env SHELL=/usr/bin/zsh ./install.sh)
}

install() {
    git clone git@github.com:Saecki/alacritty-colorscheme-rs "$src_path"

    compile
}

update() {
    git -C "$src_path" pull origin master

    compile
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
