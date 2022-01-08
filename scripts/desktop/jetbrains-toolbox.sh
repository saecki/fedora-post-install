#!/bin/sh

install() {
    dl_dir=$(mktemp -d)

    wget -O "$dl_dir/jetbrains-toolbox.tar.gz" "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"
    tar -xzf "$dl_dir/jetbrains-toolbox.tar.gz" -C "$dl_dir"
    DIR=$(find "$dl_dir" -maxdepth 1 -type d -name jetbrains-toolbox-\* -print | head -n1)

    "$DIR/jetbrains-toolbox" &
    sleep 10
    killall jetbrains-toolbox
}

update() {
    echo "let toolbox update itself"
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

