#!/bin/sh

[[ -z "$1" ]] && exit 1

input="$1"
output="${input%.*}.svg"

# If inkscape not found - exit
[[ $(command -v inkscape) = "" ]] && echo "Inkscape not found" 1>&2 && exit 1

# If file has been already converted, than doesn't convert again
if [[ ! -f "$output" ]]; then
	inkscape "$input" --export-plain-svg="$output" > /dev/null 2>&1
fi

echo "$output"
