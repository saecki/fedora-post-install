#!/bin/sh

install() {
    dl_dir=$(mktemp -d)

    wget -O "$dl_dir/jbmono.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
    unzip "$dl_dir/jbmono.zip" -d "$dl_dir/jbmono"

    git clone git@github.com:saecki/corners "$dl_dir/corners"

    rm -rf "$HOME/.local/share/fonts/JetBrainsMono/*"
    mkdir -p "$HOME/.local/share/fonts/JetBrainsMono"

    INPUT_FILE="$dl_dir/jbmono/JetBrains Mono Regular Nerd Font Complete.ttf"
    OUTPUT_FILE="$HOME/.local/share/fonts/JetBrainsMono/JetBrains Mono Regular Nerd Font Complete.ttf"

    (cd "$dl_dir/corners" && $dl_dir/corners/patch "$INPUT_FILE" "$OUTPUT_FILE")
}

update() {
    install
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

