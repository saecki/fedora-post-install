#!/bin/bash

install() {
    dl_dir=$(mktemp -d)

    git clone https://github.com/vinceliuice/Layan-gtk-theme "$dl_dir/Layan-gtk-theme"
    sudo "$dl_dir/Layan-gtk-theme/install.sh"

    gsettings set org.gnome.desktop.interface gtk-theme Layan-dark-solid
    gsettings set org.gnome.shell.extensions.user-theme name Layan-dark-solid
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
