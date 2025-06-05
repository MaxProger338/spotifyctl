#!/bin/sh

download_dir=~/.local/tmp/spotify-music-logos
main_script=~/.local/bin/spotifyctl.sh

# Does a main script exist?
[[ $(command -v "$main_script") = "" ]] && echo "spotifyctl.sh not found in \$PATH" 1>&2 && exit 1;

# Does the spotify work?
"$main_script" 2>&1 > /dev/null 
[[ $? -ne 0 ]] && echo "Spotify is not running" 1>&2 && exit 2;

url="$("$main_script" metadata | grep 'artUrl' | cut -d '|' -f 2)"
name="$(echo "$url" | cut -d '/' -f 5)"

# Creating a download dir if doesn't exist
[[ ! -d "$download_dir" ]] && mkdir -p "$download_dir"

# If the logo doesn't exist, than donload him
if [[ ! -f "${download_dir}/${name}.jpg" ]]; then
	wget -O "${download_dir}/${name}.jpg" "$url" > /dev/null 2>&1
fi

echo "${download_dir}/${name}.jpg"
