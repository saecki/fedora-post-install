#!/bin/bash

install() {
    dl_dir=$(mktemp -d)
    src_path="$dl_dir/playlist_localizer"

    git clone https://github.com/saecki/playlist_localizer "$src_path"

    "$HOME/.cargo/bin/cargo" build \
	--manifest-path="$src_path/Cargo.toml" \
	--release

    sudo cp \
	"$src_path/target/release/playlist_localizer" \
	/usr/local/bin/
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
