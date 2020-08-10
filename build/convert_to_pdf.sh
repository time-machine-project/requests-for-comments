#!/bin/bash

inpath=/opt/input
outpath=/opt/output
version_text=${VERSION:=custom-build}

find $inpath -name '*.md' -print0 |
    while IFS= read -r -d '' file; do
        cd $(dirname "$file")
        mkdir -p "$outpath"/build
        cp -R * "$outpath"/build
        cd "$outpath"/build
        name=$(basename "$file" .md)
        echo "building: $version_text $name"
        sed -i "s/-release-version-/$version_text - $(date '+%Y-%m-%d')/" ./"$name".md
        pandoc -s -F pandoc-mermaid -i ./"$name".md -o ../"$name".pdf
        rm -Rf "$outpath"/build
    done
