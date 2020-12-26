#!/bin/sh -l

npm i minify -g
apt-get update
apt-get -y install moreutils

find . -type f \( \( -iname \*.html -or -iname \*.js -or -iname \*.css \) -not \( -iname \*.min.\* -or -iname \*.map.\* \) \) | while read fname; do

    export suffix="min"

    if [[ "$fname" =~ .*\.[^.]*$ ]]; then
        ext=".${fname##*\.}"
    else
        ext=""
    fi
    echo ${fname%.*}.$suffix$ext
    minify ${fname} > ${fname%.*}.$suffix$ext
done
