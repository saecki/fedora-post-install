#!/bin/bash

for file in "$@"; do
    if [[ $file == *.pkglst ]]; then
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                packages="$packages $line"
            fi
        done < "$file"

        echo -e "\ninstalling $file:"
        sudo dnf install -y --skip-broken $packages

        packages=""
    fi

    if [[ $file == *.grplst ]]; then
        echo -e "\ninstalling $file:"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                echo -e "\ninstalling group \"$line\":"
                sudo dnf group install -y --skip-broken "$line"
            fi
        done < "$file"
    fi

    if [[ $file == *.flatpak ]]; then
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                packages="$packages $line"
            fi
        done < "$file"

        echo -e "\ninstalling $file:"
        flatpak install -y $packages

        packages=""
    fi

    if [[ $file == *.cargo ]]; then
        echo -e "\ninstalling $file:"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                echo -e "\ninstalling \"$line\":"
                cargo install $line
            fi
        done < "$file"
    fi

    if [[ $file == *.luarocks ]]; then
        echo -e "\ninstalling $file:"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                echo -e "\ninstalling \"$line\":"
                sudo luarocks install $line
            fi
        done < "$file"
    fi

    if [[ $file == *.pip3 ]]; then
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                packages="$packages $line"
            fi
        done < "$file"

        echo -e "\ninstalling $file:"
        pip3 install --user $packages

        packages=""
    fi
done

