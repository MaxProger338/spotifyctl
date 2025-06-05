#!/bin/sh

delay=3000
main_script=~/.local/bin/spotifyctl/spotifyctl.sh
download_script=~/.local/bin/spotifyctl/notify/download-track-logo.sh
convert_script=~/.local/bin/spotifyctl/notify/to-svg.sh

# If $main_script not found - exit 
[[ $(command -v "$main_script") = "" ]]     && echo "$main_script not found" 1>&2 && exit 1
# If $download_script not found - exit
[[ $(command -v "$download_script") = "" ]] && echo "$download_script not found" 1>&2 && exit 2
# If $convert_script not found - exit 
[[ $(command -v "$convert_script") =  "" ]] && echo "$convert_script not found" 1>&2 && exit 3

# If Spotify is not running - exit
"$main_script" 2>&1 > /dev/null
[[ "$?" -ne 0 ]] && echo "Spotify is not running" 1>&2 && exit 4

# Parsing
icon=$(  "$convert_script" $("$download_script"))
title=$( "$main_script" eval | grep -oP 'SPOTIFY_TITLE="\K[^"]+')
artist=$("$main_script" eval | grep -oP 'SPOTIFY_ARTIST="\K[^"]+')
album=$( "$main_script" eval | grep -oP 'SPOTIFY_ALBUM="\K[^"]+')

[[ $(command -v dunstify) = "" ]] && echo "dunstify not found in \$PATH" 1>&2 && exit 5
dunstify -i "$icon" -t "$delay" "$title" "${artist} - ${album}"
