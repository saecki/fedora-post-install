#!/bin/bash

VERSION="1.14.0"

install()  {
    curl -fLo "$HOME/.local/bin/bfg.jar" --create-dirs \
    https://repo1.maven.org/maven2/com/madgag/bfg/${VERSION}/bfg-${VERSION}.jar
}

update() {
    install
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

