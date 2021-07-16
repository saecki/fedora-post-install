#!/bin/bash

src_path="$HOME/Projects/alco"

compile() {
    (cd "$src_path" && env SHELL=/usr/bin/zsh ./install.sh)
}

install() {
    git clone git@github.com:Saecki/alco "$src_path"

    compile
}

update() {
    git -C "$src_path" pull origin main

    compile
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
