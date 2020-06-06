#!/bin/sh

install() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

update() {
    $HOME/.cargo/bin/rustup self update
    $HOME/.cargo/bin/rustup update
}

. ../util/manage.sh