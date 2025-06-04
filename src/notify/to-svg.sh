#!/bin/sh

[[ -z "$1" ]] && exit 1

input="$1"
output="${input%.*}.svg"

inkscape "$input" --export-plain-svg="$output" > /dev/null 2>&1

echo "$output"
