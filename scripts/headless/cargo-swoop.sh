#!/bin/sh

src_path="$HOME/Projects/cargo-swoop"

compile() {
    export PATH="$HOME/.cargo/bin:$PATH"
    cargo install --path="$src_path"
}

install() {
    git clone git@github.com:saecki/cargo-swoop "$src_path"

    compile
}

update() {
    git -C "$src_path" pull origin

    compile
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

