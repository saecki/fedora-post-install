#!/bin/sh

install() {
    vers=$(curl https://freefilesync.org/download.php | rg --multiline --no-filename -e "^(.*?)FreeFileSync_(.*?)_Linux.tar.gz(.*?)$" -r '$2')
    dl_dir=$(mktemp -d)
    
    sudo rm -rf /opt/FreeFileSync

    wget --no-ftps-implicit --no-cache --no-dns-cache -P $dl_dir "https://freefilesync.org/download/FreeFileSync_"$vers"_Linux.tar.gz"
    sudo tar xzf "$dl_dir/FreeFileSync_"$vers"_Linux.tar.gz" -C /opt
    
    rm -rf $dl_dir
    
    sudo /usr/local/bin/create-desktop-file \
	-e /opt/FreeFileSync/FreeFileSync \
	-n FreeFileSync \
	-i /opt/FreeFileSync/Resources/FreeFileSync.png
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
