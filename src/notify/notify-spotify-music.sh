#!/bin/sh

delay=3000

~/.local/bin/spotifyctl.sh 2>&1 > /dev/null
[[ "$?" -ne 0 ]] && exit 1

icon=$(~/.local/bin/to-svg.sh $(~/.local/bin/download-track-logo.sh))
title=$(~/.local/bin/spotifyctl.sh eval | grep -oP 'SPOTIFY_TITLE="\K[^"]+')
artist=$(~/.local/bin/spotifyctl.sh eval | grep -oP 'SPOTIFY_ARTIST="\K[^"]+')
album=$(~/.local/bin/spotifyctl.sh eval | grep -oP 'SPOTIFY_ALBUM="\K[^"]+')

dunstify -i "$icon" -t "$delay" "$title" "${artist} - ${album}"
