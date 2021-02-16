#!/bin/bash

install() {
    git clone --bare https://saecki@github.com/saecki/dotfiles.git "$HOME/.dotfiles"
    git --work-tree="$HOME" --git-dir="$HOME/.dotfiles" checkout -f
}

update() {
    git --work-tree="$HOME" --git-dir="$HOME/.dotfiles" pull origin master
    git --work-tree="$HOME" --git-dir="$HOME/.dotfiles" checkout -f
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"

