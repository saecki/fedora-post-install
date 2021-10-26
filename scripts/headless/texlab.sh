#!/bin/bash

install() {
    dl_dir=$(mktemp -d)

    wget -O "$dl_dir/texlab.tar.gz" https://github.com/latex-lsp/texlab/releases/latest/download/texlab-x86_64-linux.tar.gz
    tar xzf "$dl_dir/texlab.tar.gz" -C ~/.local/bin/
}

update() {
    install
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

