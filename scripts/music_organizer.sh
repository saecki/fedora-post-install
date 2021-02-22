#!/bin/bash

src_path="$HOME/Projects/music_organizer"

compile() {
    "$HOME/.cargo/bin/cargo" build \
    --manifest-path="$src_path/Cargo.toml" \
    --release

    sudo cp \
    "$src_path/target/release/cli" \
    /usr/local/bin/music_organizer
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
