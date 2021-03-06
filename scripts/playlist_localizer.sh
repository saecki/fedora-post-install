#!/bin/bash

src_path="$HOME/Projects/playlist_localizer"

compile() {
    (cd "$src_path" && env SHELL=/usr/bin/zsh ./install.sh)
}

install() {
    git clone git@github.com:Saecki/playlist_localizer "$src_path"
    
    compile
}

update() {
    git -C "$src_path" pull origin master

    compile
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
