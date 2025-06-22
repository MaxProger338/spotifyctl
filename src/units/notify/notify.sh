#!/bin/sh

#--- Constants -----------------
download_logo=~/.local/bin/spotifyctl/units/notify/download-logo.sh
convertor=~/.local/bin/spotifyctl/units/notify/convert.sh

#--- Errors ------------------
DOWNLOAD_LOGO_MODULE_NOT_FOUND=101
CONVERTOR_MODULE_NOT_FOUND=102

#--- FOUNDING MODULES -----------------
# If any script doesn't exist - exit with error
[[ $(command -v "$download_logo") = "" ]] && echo "Error: $download_logo module not found" 1>&2 && exit $DOWNLOAD_LOGO_MODULE_NOT_FOUND
[[ $(command -v "$convertor")     =  "" ]] && echo "Error: $convertor module not found" 1>&2 && exit $CONVERTOR_MODULE_NOT_FOUND

#--- Getting icon path ---------------
icon_path=$( "$download_logo" "$4" )
converted_icon_path=$( "$convertor" "$icon_path" )

dunstify -i "$converted_icon_path" -t "$5" "$1" "${2} - ${3}"
