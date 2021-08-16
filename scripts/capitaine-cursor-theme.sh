#!/bin/bash

install() {
    dl_dir=$(mktemp -d)
    git_dir="$dl_dir/capitaine-cursors"
    theme_dir="$HOME/.local/share/icons/capitaine-cursors-light"

    git clone https://github.com/keeferrourke/capitaine-cursors.git "$git_dir"
    (cd "$git_dir" && $git_dir/build.sh -p unix -t light -d xxhd)

    rm -rf "$theme_dir"
    cp -pr "$git_dir/dist/light" "$theme_dir"

    gsettings set org.gnome.desktop.interface cursor-theme capitaine-cursors-light
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
