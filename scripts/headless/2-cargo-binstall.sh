#!/bin/bash

install() {
    curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
}

update() {
    cargo binstall -y cargo-binstall
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

