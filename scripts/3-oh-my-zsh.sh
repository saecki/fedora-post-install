#!/bin/sh

install() {
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

update() {
    upgrade_oh_my_zsh
}

. ../util/manage.sh