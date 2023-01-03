#!/bin/sh

install() {
    dl_dir=$(mktemp -d)
    info=$(curl https://www.teamspeak.com/versions/client.json | jq -r '.linux.x86_64')
    url=$(echo "$info" | jq -r '.mirrors."teamspeak.com"')

    wget -O "$dl_dir/teamspeak.run" "$url"

    sudo rm -rf /opt/TeamSpeak3-Client-linux_amd64

    chmod +x "$dl_dir/teamspeak.run"

    expect_commands="
    spawn $dl_dir/teamspeak.run
    sleep 1
    send \"\\r\"
    sleep 1
    send \"q\"
    sleep 1
    send \"y\\r\"
    expect eof {exit}"

    (cd "$dl_dir" && expect -c "${expect_commands//
    /;}")

    sudo mv "$dl_dir/TeamSpeak3-Client-linux_amd64" /opt/

    sudo /usr/local/bin/create-desktop-file \
    -e /opt/TeamSpeak3-Client-linux_amd64/ts3client_runscript.sh \
    -n TeamSpeak \
    -g com.teamspeak.TeamSpeak \
    -f teamspeak3
}

update() {
    echo "let teamspeak update itself"
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

