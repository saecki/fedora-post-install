#!/bin/sh

vers="11.0"

install() {
    dl_dir=$(mktemp -d)
    
    sudo rm -rf /opt/FreeFileSync

    wget --no-ftps-implicit -P $dl_dir "https://freefilesync.org/download/FreeFileSync_"$vers"_Linux.tar.gz"
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

. "$(dirname $(dirname $0))/util/manage.sh"
