#!/bin/bash

install() {
    dl_dir=$(mktemp -d)

    sudo rm -rf "/usr/share/themes/Layan*"

    git clone https://github.com/vinceliuice/Layan-gtk-theme.git "$dl_dir/Layan-gtk-theme"
    sudo "$dl_dir/Layan-gtk-theme/install.sh"
    rm -rf "$dl_dir"

    gsettings set org.gnome.desktop.interface gtk-theme Layan-dark-solid
    gsettings set org.gnome.shell.extensions.user-theme name Layan-dark-solid
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
