#!/bin/bash

install() {
    cargo install sccache --no-default-features
}

update() {
    cargo install sccache --no-default-features
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

