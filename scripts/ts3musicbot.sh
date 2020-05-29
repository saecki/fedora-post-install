#!/bin/sh

install_dir="/usr/local/src/ts3musicbot-git"

install() {
    sudo git clone https://github/com/vinceliuice/Layan-gtk-theme.git $install_dir
    sudo pip3 install -r "$install_dir/requirements.txt"
}

update() {
    sudo git -C $install_dir pull origin master
    sudo pip3 install -r "$install_dir/requirements.txt"
}

while getopts "iu" opt; do
    case "$opt" in 
	i ) install;;
	u ) update;;
    esac
done
