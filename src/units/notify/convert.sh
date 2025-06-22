#!/bin/sh

#--- Errors ---------------
INPUT_EMPTY=201
INKSCAPE_NOT_FOUND=202

#--- Constants ---------------
input="$1"
[[ -z "$input" ]] && echo "Error: input is empty" && exit $INPUT_EMPTY
output="${input%.*}.svg"

# If inkscape not found - exit
[[ $(command -v inkscape) = "" ]] && echo "Error: Inkscape not found" 1>&2 && exit $INKSCAPE_NOT_FOUND

# If file has been already converted, than doesn't convert again
if [[ ! -f "$output" ]]; then
	inkscape "$input" --export-plain-svg="$output" > /dev/null 2>&1
fi

echo "$output"
