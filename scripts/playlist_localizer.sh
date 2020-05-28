#!/bin/sh

src_path="$HOME/IdeaProjects/playlist_localizer"

install() {
    git clone https://github.com/saecki/playlist_localizer.git $src_path
}

update() {
    git -C $src_path pull origin master
}

while getopts "iu" opt; do
    case "$opt" in 
	i ) install;;
	u ) update;;
    esac
done

