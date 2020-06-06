#!/bin/sh

src_path="$HOME/IdeaProjects/playlist_localizer"

compile() {
    $HOME/.cargo/bin/cargo build \
	--manifest-path="$src_path/Cargo.toml" \
	--release

    sudo cp \
	$src_path/target/release/playlist_localizer \
	/usr/local/bin/
}

install() {
    git clone https://github.com/saecki/playlist_localizer.git $src_path

    compile
}

update() {
    git -C $src_path pull origin master

    compile
}

. ../util/manage.sh
