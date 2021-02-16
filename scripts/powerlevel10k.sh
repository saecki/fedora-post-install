#!/bin/bash

p10kpath="$HOME/.config/zsh/powerlevel10k"

install() {
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10kpath"
}

update() {
    git -C "$p10kpath" pull
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
