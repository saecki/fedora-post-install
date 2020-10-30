#!/bin/sh

install() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

update() {
    $HOME/.cargo/bin/rustup update
    $HOME/.cargo/bin/rustup completions zsh rustup > $ZDOTDIR/functions
    $HOME/.cargo/bin/rustup completions zsh cargo > $ZDOTDIR/functions
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
