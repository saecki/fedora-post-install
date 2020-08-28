#!/bin/sh

install() {
    sudo git clone --bare https://saecki@github.com/saecki/scripts.git /usr/local/bin/.scripts
    sudo git --work-tree=/usr/local/bin/ --git-dir=/usr/local/bin/.scripts checkout -f
}

update() {
    sudo git --work-tree=/usr/local/bin/ --git-dir=/usr/local/bin/.scripts pull origin master
    sudo git --work-tree=/usr/local/bin/ --git-dir=/usr/local/bin/.scripts checkout -f
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
