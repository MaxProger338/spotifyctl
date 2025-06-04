#!/bin/sh

~/.local/bin/spotifyctl.sh 2>&1 > /dev/null 
[[ $? -ne 0 ]] && exit 1;

url=$(~/.local/bin/spotifyctl.sh metadata | grep 'artUrl' | cut -d '|' -f 2)
name=$(echo "$url" | cut -d '/' -f 5)
path=/tmp/spotify-music-logos

[[ ! -d "$path" ]] && mkdir "$path"
if [[ ! -f "${path}/${name}.jpg" ]]; then
	wget -O "${path}/${name}.jpg" "$url" > /dev/null 2>&1
fi

echo "${path}/${name}.jpg"
