#!/bin/sh

download_dir=~/.tmp/spotify-music-logos

# Creating a download dir if doesn't exist
[[ ! -d "$download_dir" ]] && mkdir -p "$download_dir"

url="$1"
id="$(echo "$url" | cut -d '/' -f 5)"
# If the logo doesn't exist, than donload him
if [[ ! -f "${download_dir}/${id}.jpg" ]]; then
	wget -O "${download_dir}/${id}.jpg" "$url" > /dev/null 2>&1
fi

echo "${download_dir}/${id}.jpg"
