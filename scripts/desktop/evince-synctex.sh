#!/bin/bash

install() {
    pip3 install --user https://github.com/efoerster/evince-synctex/archive/master.zip
}

update() {
    pip3 install --upgrade --user https://github.com/efoerster/evince-synctex/archive/master.zip
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

