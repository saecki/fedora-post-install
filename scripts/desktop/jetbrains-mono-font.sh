#!/bin/sh

install() {
    dl_dir=$(mktemp -d)

    wget -O "$dl_dir/jbmono.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

    rm -rf ~/.local/share/fonts/JetBrainsMono
    mkdir -p ~/.local/share/fonts
    unzip "$dl_dir/jbmono" -d ~/.local/share/fonts/JetBrainsMono
}

update() {
    install
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

