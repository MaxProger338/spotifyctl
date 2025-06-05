#!/bin/sh

# Variables
config_path=""

# Colors
RED="\003[31m"
NC="\003[0m"

read -p "Enter config path: " config_path

[[ -z $config_path ]] && echo -e "${RED}empty config path${NC}" && exit 1;

echo -e "#--- SPOTIFY ------------------------------------\n# play next\nbindsym F9 exec ~/.local/bin/spotifyctl/spotifyctl.sh next\n# next and pause\nbindsym F8 exec \"~/.local/bin/spotifyctl/spotifyctl.sh next && \\ \n                 ~/.local/bin/spotifyctl/spotifyctl.sh pause\"\n# play prev\nbindsym F7 exec ~/.local/bin/spotifyctl/spotifyctl.sh prev\n# play/pause\nbindsym F6 exec ~/.local/bin/spotifyctl/spotifyctl.sh play\n# show art/name/artist in notify\nbindsym F5 exec ~/.local/bin/spotifyctl/notify-spotify-music.sh" >> $config_path
