#!/bin/sh

patch_and_move() {
    FILENAME="$1"
    INPUT_FILE="$dl_dir/jbmono/$FILENAME"
    OUTPUT_FILE="$HOME/.local/share/fonts/JetBrainsMono/$FILENAME"

    (cd "$dl_dir/corners" && $dl_dir/corners/patch "$INPUT_FILE" "$OUTPUT_FILE")
}

install() {
    dl_dir=$(mktemp -d)

    wget -O "$dl_dir/jbmono.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
    unzip "$dl_dir/jbmono.zip" -d "$dl_dir/jbmono"

    git clone git@github.com:saecki/corners "$dl_dir/corners"

    rm -rf "$HOME/.local/share/fonts/JetBrainsMono/*"
    mkdir -p "$HOME/.local/share/fonts/JetBrainsMono"

    patch_and_move "JetBrainsMonoNerdFont-Regular.ttf"
    patch_and_move "JetBrainsMonoNerdFont-Medium.ttf"
    patch_and_move "JetBrainsMonoNerdFont-SemiBold.ttf"
    patch_and_move "JetBrainsMonoNerdFont-Bold.ttf"
}

update() {
    install
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

