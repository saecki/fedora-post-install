#!/bin/bash

src_path="$HOME/Projects/comeondosomething"

compile() {
    export PATH="$HOME/.cargo/bin:$PATH"
    (cd "$src_path" && cargo install --path cli)
}

install() {
    git clone git@github.com:Saecki/comeondosomething "$src_path"
    
    compile
}

update() {
    git -C "$src_path" pull origin master

    compile
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
