#!/bin/bash

src_path="$HOME/Projects/playlist_localizer"

compile() {
    export PATH="$HOME/.cargo/bin:$PATH"
    export SHELL=/usr/bin/zsh
    (cd "$src_path" && ./install.sh)
}

install() {
    git clone git@github.com:Saecki/playlist_localizer "$src_path"
    
    compile
}

update() {
    git -C "$src_path" pull origin master

    compile
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

