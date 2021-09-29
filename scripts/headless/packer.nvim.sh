#!/bin/bash

install()  {
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

update() {
    echo "Run PackerUpdate from within vim to update packer.nvim"
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

