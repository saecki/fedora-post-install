#!/bin/sh

install() {
    dl_dir=$(mktemp -d)
    src_path="$dl_dir/musicbrainz_plugins"

    git clone https://github.com/saecki/musicbrainz_plugins "$src_path"

    (cd "$src_path" && ./install.sh)
}

update() {
    install
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

