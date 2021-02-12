#!/bin/sh

install() {
    dl_dir=$(mktemp -d)

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > "$dl_dir/rustup.sh"
    chmod +x "$dl_dir/rustup.sh"

    $dl_dir/rustup.sh --no-modify-path -y
}

update() {
    $HOME/.cargo/bin/rustup update
    $HOME/.cargo/bin/rustup completions zsh rustup > $ZDOTDIR/functions
    $HOME/.cargo/bin/rustup completions zsh cargo > $ZDOTDIR/functions
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
