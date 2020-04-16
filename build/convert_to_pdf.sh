#!/bin/bash

inpath=/opt/input
outpath=/opt/output

find $inpath -name '*.md' -print0 | 
    while IFS= read -r -d '' file; do
        cd $(dirname "$file") 
        name=$(basename "$file" .md)
        echo $VERSION
        sed -i "s/-release-version-/$VERSION - $(date '+%Y-%m-%d')/" $file
        pandoc -s -F pandoc-mermaid -i "$name".md -o "$name".pdf
        mv "$name".pdf $outpath
    done