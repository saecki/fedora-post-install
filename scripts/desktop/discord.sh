#!/bin/bash

install() {
    dl_dir=$(mktemp -d)

    wget -O "$dl_dir/discord.tar.gz" https://discordapp.com/api/download\?platform\=linux\&format\=tar.gz

    sudo rm -rf /opt/Discord
    sudo tar xzf "$dl_dir/discord.tar.gz" -C /opt/

    sudo /usr/local/bin/create-desktop-file \
    -f Discord \
    -e "/opt/Discord/Discord --no-sandbox" \
    -s discord \
    -n Discord \
    -g com.discordapp.Discord
}

update() {
    echo "Let discord update itself or reinstall it"
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

