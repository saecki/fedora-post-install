#!/bin/sh

install() {
    dl_dir=$(mktemp -d)

    wget https://updates.getmailspring.com/download?platform=linuxRpm -O "$dl_dir/mailspring.rpm"
    sudo dnf install -y "$dl_dir/mailspring.rpm"
    rm -rf $dl_dir
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

