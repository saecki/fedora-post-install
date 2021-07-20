#!/bin/bash

bin_url="https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz"
bin_path="$HOME/.local/bin/rust-analyzer"

install() {
    curl -L "$bin_url" | gunzip -c - > "$bin_path"
    chmod +x "$bin_path"
}

update() {
    rm "$bin_path"
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
