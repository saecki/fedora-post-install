#!/bin/sh

for file in $@; do
    if [[ $file == *.gsettings ]]; then
        echo -e "\napplying settings from $file:"

        schemadir=""
        while read line; do
            if [[ $line == schemadir:* ]]; then 
                schemadir=$(eval "echo ${line#schemadir:}")
                echo "custom schemadir: $schemadir"
            elif [[ "$line" != "" ]] && [[ $line != "#"* ]]; then
                echo "$line"

                if [[ $schemadir != "" ]]; then
                    gsettings --schemadir $schemadir set $line
                else
                    gsettings set $line
                fi
            fi
        done < $file

    fi
done
