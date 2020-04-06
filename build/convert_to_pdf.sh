#!/bin/bash

inpath=/opt/input
outpath=/opt/output

find $inpath -name '*.md' -print0 | 
    while IFS= read -r -d '' file; do
        name=$(basename "$file" .md)
        sed -i "s/-release-version-/Release $VERSION - $(date '+%Y-%m-%d')/" $file
        pandoc -s --resource-path=$(dirname "$file") -o "$outpath"/"$name".pdf $file
    done