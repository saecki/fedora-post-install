#!/bin/bash

install() {
    dl_dir=$(mktemp -d)
    git clone --bare git@github.com:Saecki/scripts "$dl_dir/.scripts"
    sudo mv "$dl_dir/.scripts" /usr/local/bin
    sudo git --work-tree=/usr/local/bin/ --git-dir=/usr/local/bin/.scripts checkout -f
}

update() {
    git --git-dir=/usr/local/bin/.scripts fetch origin master:master
    sudo git --work-tree=/usr/local/bin/ --git-dir=/usr/local/bin/.scripts checkout -f
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
