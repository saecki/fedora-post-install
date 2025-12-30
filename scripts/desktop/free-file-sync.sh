#!/bin/sh

fetch_version() {
    vers=$(curl https://freefilesync.org/download.php | rg --no-filename \
        -e "^(.*?)FreeFileSync_(.*?)_Linux_x86_64.tar.gz(.*?)$" -r '$2')
    echo "$vers"
}

download() {
    vers="$1"
    dl_dir=$(mktemp -d)

    sudo rm -rf /opt/FreeFileSync

    wget -O "$dl_dir/FreeFileSync.tar.gz" "https://freefilesync.org/download/FreeFileSync_${vers}_Linux_x86_64.tar.gz"
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
}

install() {
    vers=$(fetch_version)
    if [[ $vers == "" ]]; then
        echo -e "\nunable to fetch version"
        exit 1
    else
        echo -e "\ninstalling version $vers\n"
    fi

    download "$vers"
}

update() {
    echo "Reinstall FreeFileSync manually"
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

