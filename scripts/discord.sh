#!/bin/sh

install() {
    dl_dir=$(mktemp -d)

    wget -P $dl_dir https://discordapp.com/api/download\?platform\=linux\&format\=tar.gz

    sudo rm -rf /opt/Discord
    sudo tar xzf "$dl_dir/download?platform=linux&format=tar.gz" -C /opt/

    rm -rf $dl_dir

    sudo /usr/local/bin/create-desktop-file \
	-e /opt/Discord/Discord \
	-n Discord \
	-g com.discordapp.Discord
}

update() {
    echo "Let discord update itself or reinstall it"
}

. ../util/manage.sh
