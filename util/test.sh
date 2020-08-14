#!/bin/bash

echo "\$0: $0"

for f in $@; do
    echo "arg: $f"
done

abspath=$(realpath $0)
echo "abspath: $abspath"

echo $(basename $abspath)
a=$(dirname $abspath)
echo $a
b=$(dirname $a)
echo $b
c=$(dirname $b)
echo $c
