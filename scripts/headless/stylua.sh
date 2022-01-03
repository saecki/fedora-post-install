#!/bin/bash

install() {
    cargo install stylua
}

update() {
    cargo install stylua
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

