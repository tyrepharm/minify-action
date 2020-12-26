#!/bin/sh -l

npm i minify -g
apt-get update
apt-get -y install moreutils

find . -type f \( \( -iname \*.html -or -iname \*.js -or -iname \*.css \) -not \( -iname \*.min.\* -or -iname \*.map.\* \) \) | while read fname; do

    suffix=".min."
    filename=$(basename -- "$fname")
    dir=$(dirname $fname)
    extension="${filename##*.}"
    filename="${filename%.*}"
    newname="${filename}${suffix}${extension}"

    path="${dir}/${newname}"

    echo ${path}
    minify ${fname} > ${path}
done
