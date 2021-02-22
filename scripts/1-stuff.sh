#!/bin/bash

install() {
    git clone --bare git@github.com:Saecki/stuff "$HOME/.stuff"
    git --work-tree="$HOME" --git-dir="$HOME/.stuff" checkout -f
}

update() {
    git --work-tree="$HOME" --git-dir="$HOME/.stuff" pull origin master
    git --work-tree="$HOME" --git-dir="$HOME/.stuff" checkout -f
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
