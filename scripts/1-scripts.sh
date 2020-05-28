#!/bin/sh

install() {
    sudo git clone --bare https://saecki@bitbucket.org/saecki/.scripts.git /usr/local/bin/.scripts
    sudo git --work-tree=/usr/local/bin/ --git-dir=/usr/local/bin/.scripts checkout -f
}

update() {
    sudo git --work-tree=/usr/local/bin/ --git-dir=/usr/local/bin/.scripts pull origin master
    sudo git --work-tree=/usr/local/bin/ --git-dir=/usr/local/bin/.scripts checkout -f
}

while getopts "iu" opt; do
    case "$opt" in 
	i ) install;;
	u ) update;;
    esac
done

