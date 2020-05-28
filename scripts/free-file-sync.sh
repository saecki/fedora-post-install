#!/bin/sh

vers="10.24"

install() {
    dl_dir=$(mktemp -d)
    
    sudo rm -rf /opt/FreeFileSync

    wget -P $dl_dir "https://freefilesync.org/download/FreeFileSync_"$vers"_Linux.tar.gz"
    sudo tar xzf "$dl_dir/FreeFileSync_"$vers"_Linux.tar.gz" -C /opt
    
    rm -rf $dl_dir
    
    sudo /usr/local/bin/create-desktop-file \
	-e /opt/FreeFileSync/FreeFileSync \
	-n FreeFileSync \
	-i /opt/FreeFileSync/Resources/FreeFileSync.png
}

update() {
    echo "Update the version number and reinstall"
}

while getopts "iu" opt; do
    case "$opt" in 
	i ) install;;
	u ) update;;
    esac
done

