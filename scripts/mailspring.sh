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

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
