#!/bin/bash

src_path="$HOME/Projects/music_organizer"

compile() {
    (cd "$src_path" && env SHELL=/usr/bin/zsh ./install.sh)
}

install() {
    git clone git@github.com:Saecki/music_organizer "$src_path"

    compile
}

update() {
    git -C "$src_path" pull origin master

    compile
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
