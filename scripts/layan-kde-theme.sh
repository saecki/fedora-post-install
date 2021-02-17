#!/bin/bash

install() {
    dl_dir=$(mktemp -d)

    git clone https://github.com/vinceliuice/Layan-kde "$dl_dir/Layan-kde-theme"
    sudo "$dl_dir/Layan-kde-theme/install.sh"
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
