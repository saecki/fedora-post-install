#!/bin/sh

install() {
    dl_dir=$(mktemp -d)

    git clone https://github.com/vinceliuice/Layan-kde "$dl_dir/Layan-kde-theme"
    "$dl_dir/Layan-kde-theme/install.sh"
}

update() {
    install
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

