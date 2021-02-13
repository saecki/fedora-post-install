#!/bin/sh

install() {
    dl_dir=$(mktemp -d)

    sudo rm -rf "/usr/share/kvantum/Layan*"

    git clone https://github.com/vinceliuice/Layan-kde-theme.git "$dl_dir/Layan-kde-theme"
    sudo $dl_dir/Layan-kde-theme/install.sh
    rm -rf $dl_dir
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
