#!/bin/bash

install() {
    vers=$(curl https://freefilesync.org/download.php | rg --multiline --no-filename -e "^(.*?)FreeFileSync_(.*?)_Linux.tar.gz(.*?)$" -r "$2")
    dl_dir=$(mktemp -d)

    sudo rm -rf /opt/FreeFileSync

    wget -O "$dl_dir/FreeFileSync.tar.gz" "https://freefilesync.org/download/FreeFileSync_${vers}_Linux.tar.gz"
    tar xzf "$dl_dir/FreeFileSync.tar.gz" -C "$dl_dir"

    expect_commands="
    spawn $dl_dir/FreeFileSync_${vers}_Install.run
    sleep 1
    send \"y\\r\"
    sleep 1
    send \"y\\r\"
    expect eof {exit}"

    (cd "$dl_dir" && sudo expect -c "${expect_commands//
    /;}")


    rm -rf "$dl_dir"
}

update() {
    echo "Let FreeFileSync update itself or reinstall it"
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
