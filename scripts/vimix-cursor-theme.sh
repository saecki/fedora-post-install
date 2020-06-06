#!/bin/sh

install() {
    dl_dir=$(mktemp -d)

    git clone https://github.com/vinceliuice/Vimix-cursors.git "$dl_dir/Vimix-cursors"
    sudo $dl_dir/Vimix-cursors/install.sh
    rm -rf $dl_dir

    gsettings set org.gnome.desktop.interface cursor-theme Vimix-white-cursors
}

update() {
    install
}

. ../util/manage.sh