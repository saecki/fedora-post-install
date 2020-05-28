#!/bin/sh

install() {
    git clone --bare https://saecki@bitbucket.org/saecki/.dotfiles.git $HOME/.dotfiles
    git --work-tree=$HOME --git-dir=$HOME/.dotfiles checkout -f
}

update() {
    git --work-tree=$HOME --git-dir=$HOME/.dotfiles pull origin master
    git --work-tree=$HOME --git-dir=$HOME/.dotfiles checkout -f
}

while getopts "iu" opt; do
    case "$opt" in 
	i ) install;;
	u ) update;;
    esac
done

