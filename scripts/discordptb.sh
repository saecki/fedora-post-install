#!/bin/bash

install() {
    dl_dir=$(mktemp -d)

    wget -P "$dl_dir/discordptb.tar.gz" https://discordapp.com/api/download/ptb\?platform\=linux\&format\=tar.gz

    sudo rm -rf /opt/DiscordPTB
    sudo tar xzf "$dl_dir/discordptb.tar.gz" -C /opt/

    rm -rf "$dl_dir"

    sudo /usr/local/bin/create-desktop-file \
    -e /opt/DiscordPTB/DiscordPTB \
    -n DiscordPTB \
    -g com.discordapp.Discord
}

update() {
    echo "Let discord update itself or reinstall it"
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
