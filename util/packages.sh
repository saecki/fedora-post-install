#!/bin/sh

. "$(dirname $0)/print.sh"

for file in "$@"; do
    if [[ $file == *.pkglst ]]; then
        heading2 "installing $file"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                packages="$packages $line"
            fi
        done < "$file"
        sudo dnf install -y --skip-broken $packages
        packages=""
    fi

    if [[ $file == *.grplst ]]; then
        heading2 "installing $file"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                heading3 "installing group \"$line\":"
                sudo dnf group install -y --skip-broken "$line"
            fi
        done < "$file"
    fi

    if [[ $file == *.flatpak ]]; then
        heading2 "installing $file"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                packages="$packages $line"
            fi
        done < "$file"
        flatpak install -y $packages
        packages=""
    fi

    if [[ $file == *.cargo ]]; then
        heading2 "installing $file"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                heading3 "installing \"$line\":"
                cargo binstall -y $line
            fi
        done < "$file"
    fi

    if [[ $file == *.luarocks ]]; then
        heading2 "installing $file"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                heading3 "installing \"$line\":"
                sudo luarocks install $line
            fi
        done < "$file"
    fi

    if [[ $file == *.pip3 ]]; then
        heading2 "installing $file"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                packages="$packages $line"
            fi
        done < "$file"
        pip3 install --user $packages
        packages=""
    fi
done

