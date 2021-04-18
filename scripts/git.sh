#!/bin/bash

install() {
    git config --global pull.ff only
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
