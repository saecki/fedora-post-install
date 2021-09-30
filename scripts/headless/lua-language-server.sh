#!/bin/bash

src_path="$HOME/.local/share/nvim/lua-language-server"

compile() {
    (cd "$src_path/3rd/luamake" && ./compile/install.sh)
    (cd "$src_path" && ./3rd/luamake/luamake rebuild)
}

install() {
    git clone --recursive git@github.com:sumneko/lua-language-server "$src_path"

    compile
}

update() {
    git -C "$src_path" pull origin
    git -C "$src_path" submodule update --init --recursive

    compile
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

