#!/bin/bash

# Initialize variables
inpath=$1
outpath=$2
version=$3
if [ -z "$inpath" ]; then
	inpath=/opt/input
fi
if [ -z "$outpath" ]; then
	outpath=/opt/output
fi
if [ -z "$version" ]; then
	version=${VERSION:=custom-build}
fi
pdfpath="$outpath"/rfc-book_$(date '+%Y-%m-%d').pdf
tmppath="$outpath"/tmp
mkdir -p "$tmppath"

# Copy all markdown files into a single folder so relative
# links to files still work in the final markdown
cd "$inpath" || exit
shopt -s globstar
for i in **/*.md; do
	cp -r "$(dirname "$i")"/* "$tmppath"
done

cd "$tmppath" || exit

# Create basic markdown content with yaml header
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

# Transform individual markdown files sorted by their name, excluding the template
for md in $(find . -type f -name "*.md" -not -name "RFC-template.md" | sort | xargs -n 1 basename); do
	# Extract metadata
	suffix=
	if [[ $(find $inpath -type f -name "$(basename "$md")") == *"draft"* ]]; then
		suffix=" [Draft]"
	fi
	title=$(grep -oP '(?<=^title: ").*?(?=\"$)' "$md")
	number=$(basename "$md" .md)
	authors=$(sed -n '/^author:/,/^\w/{/^author:/!{/^\w/!p}}' "$md" | sed "s/^  - //g" | paste -s -d"," - | sed 's/,/, /g')
	# Transform existing headings to be one level lower
	sed -i 's/^#####/######/g' "$md"
	sed -i 's/^####/#####/g' "$md"
	sed -i 's/^###/####/g' "$md"
	sed -i 's/^##/###/g' "$md"
	sed -i 's/^#/##/g' "$md"
	# Remove yaml block
	sed -i '/^---/,/^\---/{/^---/!{/^\---/!d}}' "$md"
	sed -i '/---/d' "$md"
	# Insert rfc title heading and authors
	sed -i "1s/^/# $number: $title$suffix\n\n$authors\n\n/" "$md"
	# append content to joined markdown content
	text=$'\n'${text}$'\n'"\newpage"$(cat "$md")$'\n\n'
done

# Build pdf
pandoc -s -M date="Version $version - $(date "+%B%e, %Y")" --toc -f markdown -o "$pdfpath" <(echo "$text")

# Remove temporary files
cd ..
rm -Rf tmp
