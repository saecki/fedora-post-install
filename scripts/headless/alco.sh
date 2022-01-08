#!/bin/sh

src_path="$HOME/Projects/alco"

compile() {
    export PATH="$HOME/.cargo/bin:$PATH"
    export SHELL=/usr/bin/zsh
    (cd "$src_path" && ./install.sh)
}

install() {
    git clone git@github.com:Saecki/alco "$src_path"

    compile
}

update() {
    git -C "$src_path" pull origin main

    compile
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

