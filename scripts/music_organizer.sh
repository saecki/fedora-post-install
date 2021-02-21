#!/bin/bash

install() {
    dl_dir=$(mktemp -d)
    src_path="$dl_dir/music_organizer"

    git clone https://github.com/saecki/music_organizer "$src_path"

    "$HOME/.cargo/bin/cargo" build \
	--manifest-path="$src_path/Cargo.toml" \
	--release

    sudo cp \
	"$src_path/target/release/cli" \
	/usr/local/bin/music_organizer
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
