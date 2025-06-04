#!/bin/sh

download_dir=~/.local/tmp/spotify-music-logos

# Does the spotify work?
~/.local/bin/spotifyctl.sh 2>&1 > /dev/null 
[[ $? -ne 0 ]] && exit 1;

url="$(~/.local/bin/spotifyctl.sh metadata | grep 'artUrl' | cut -d '|' -f 2)"
name="$(echo "$url" | cut -d '/' -f 5)"

# Creating a download dir if doesn't exist
[[ ! -d "$download_dir" ]] && mkdir -p "$download_dir"

# If the logo doesn't exist, than donload him
if [[ ! -f "${download_dir}/${name}.jpg" ]]; then
	wget -O "${download_dir}/${name}.jpg" "$url" > /dev/null 2>&1
fi

echo "${download_dir}/${name}.jpg"
