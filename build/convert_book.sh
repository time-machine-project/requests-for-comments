#!/bin/bash

inpath=$1
outpath=$2

if [ -z "$inpath" ]; then
	inpath=/opt/input
fi

if [ -z "$outpath" ]; then
	outpath=/opt/output
fi

pdfpath="$outpath"/rfc-book_$(date '+%Y-%m-%d').pdf
tmppath="$outpath"/tmp
mkdir -p "$tmppath"

cd "$inpath" || exit

shopt -s globstar
for i in **/*.md; do
	cp -r "$(dirname "$i")"/* "$tmppath"
done

cd "$tmppath" || exit

read -r -d '' text <<EOM
---
title: Time Machine Requests for Comments
subtitle: Current state of the design documents
author:
  - The RFC writers
documentclass: scrreprt
classoption:
  - oneside
output: pdf_document
---


EOM

for md in $(find . -type f -name "*.md" -not -name "RFC-template.md" | sort | xargs -n 1 basename); do

	suffix=
	if [[ $(find $inpath -type f -name "$(basename "$md")") == *"draft"* ]]; then
		suffix=" [Draft]"
	fi
	title=$(grep -oP '(?<=^title: ").*?(?=\"$)' "$md")
	number=$(basename "$md" .md)
	authors=$(sed -n '/^author:/,/^\w/{/^author:/!{/^\w/!p}}' "$md" | sed "s/^  - //g" | paste -s -d"," - | sed 's/,/, /g')
	sed -i 's/^#####/######/g' "$md"
	sed -i 's/^####/#####/g' "$md"
	sed -i 's/^###/####/g' "$md"
	sed -i 's/^##/###/g' "$md"
	sed -i 's/^#/##/g' "$md"
	sed -i '/^---/,/^\---/{/^---/!{/^\---/!d}}' "$md"
	sed -i '/---/d' "$md"
	sed -i "1s/^/# $number: $title$suffix\n\n$authors\n\n/" "$md"
	text=$'\n'${text}$'\n'"\newpage"$(cat "$md")$'\n\n'
done

pandoc -s -M date="$(date "+%B%e, %Y")" --toc -f markdown -o "$pdfpath" <(echo "$text")

cd ..
rm -Rf tmp
