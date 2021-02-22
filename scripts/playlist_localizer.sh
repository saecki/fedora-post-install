#!/bin/bash

src_path="$HOME/Projects/playlist_localizer"

compile() {
    "$HOME/.cargo/bin/cargo" build \
    --manifest-path="$src_path/Cargo.toml" \
    --release

    sudo cp \
    "$src_path/target/release/playlist_localizer" \
    /usr/local/bin/
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
