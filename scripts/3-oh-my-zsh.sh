#!/bin/sh

install() {
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

update() {
    upgrade_oh_my_zsh
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
