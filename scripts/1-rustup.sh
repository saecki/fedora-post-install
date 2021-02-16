#!/bin/bash

completions() {
    "$HOME/.cargo/bin/rustup" completions zsh rustup > "$ZDOTDIR/functions/_rustup"
    "$HOME/.cargo/bin/rustup" completions zsh cargo > "$ZDOTDIR/functions/_cargo"
}

install() {
    dl_dir=$(mktemp -d)

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > "$dl_dir/rustup.sh"
    chmod +x "$dl_dir/rustup.sh"

    "$dl_dir/rustup.sh" --no-modify-path -y
    completions
}

update() {
    "$HOME/.cargo/bin/rustup" update
    completions
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"

