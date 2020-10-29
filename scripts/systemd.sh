#!/bin/sh

install() {
    sudo systemctl disable abrtd.service
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
