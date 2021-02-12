#!/bin/sh

install() {
    git clone --bare https://saecki@github.com/saecki/dotfiles.git $HOME/.dotfiles
    git --work-tree=$HOME --git-dir=$HOME/.dotfiles checkout -f
    
    source ~/.zprofile
}

update() {
    git --work-tree=$HOME --git-dir=$HOME/.dotfiles pull origin master
    git --work-tree=$HOME --git-dir=$HOME/.dotfiles checkout -f
   
    source ~/.zprofile
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
