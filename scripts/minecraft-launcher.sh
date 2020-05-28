#!/bin/sh

install() {
    dl_dir=$(mktemp)

    wget -P $dl_dir https://launcher.mojang.com/download/Minecraft.tar.gz
    
    sudo rm -rf /opt/minecraft-launcher
    sudo tar xzf $dl_dir/Minecraft.tar.gz -C /opt/

    rm -rf $dl_dir

    sudo /usr/local/bin/create-desktop-file \
	-e /opt/minecraft-launcher/minecraft-launcher \
	-n Minecraft \
	-g com.mojang.Minecraft
}

update() {
    install
}

while getopts "iu" opt; do
    case "$opt" in 
	i ) install;;
	u ) update;;
    esac
done

