#!/bin/bash

install() {
    dl_dir=$(mktemp -d)
    vers=$(curl https://api.github.com/repos/balena-io/etcher/releases/latest | jq -r '.tag_name')
    url="https://github.com/balena-io/etcher/releases/download/$vers/balena-etcher-electron-${vers:1}.x86_64.rpm"

    wget -O "$dl_dir/etcher.rpm" "$url"

    sudo dnf install -y "$dl_dir/etcher.rpm"
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
