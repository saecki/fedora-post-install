#!/bin/sh

for file in $@; do
    if [[ $file == *.gsettings ]]; then
        echo -e "\napplying settings from $file:"

        while read line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                echo "setting: $line"
                gsettings set $line
            fi
        done < $file

    fi
done
