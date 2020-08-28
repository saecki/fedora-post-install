#!/bin/sh

install() {
    dl_dir=$(mktemp -d)

    git clone https://github.com/vinceliuice/Tela-icon-theme.git "$dl_dir/Tela-icon-theme"
    sudo $dl_dir/Tela-icon-theme/install.sh blue
    rm -rf $dl_dir

    gsettings set org.gnome.desktop.interface icon-theme Tela-blue-dark
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
