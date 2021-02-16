#!/bin/bash

for file in "$@"; do
    if [[ $file == *.pkglst ]]; then
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                packages="$packages $line"
            fi
        done < "$file"

        echo -e "\ninstalling $file:"
        sudo dnf install -y --skip-broken "$packages"

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


        packages=""
    fi
done

