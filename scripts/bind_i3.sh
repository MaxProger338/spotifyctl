#!/bin/sh

# Variables
config_path=""

# Colors
RED="\003[31m"
NC="\003[0m"

read -p "Enter the absolute config path: " config_path

[[ -z $config_path ]] && echo -e "${RED}empty config path${NC}" && exit 1;

echo -e "\n#--- SPOTIFY ------------------------------------\n# play next\nbindsym F9 exec spotifyctl.sh next\n# next and pause\nbindsym F8 exec spotifyctl.sh next-pause\n# play prev\nbindsym F7 exec spotifyctl.sh prev\n# play/pause\nbindsym F6 exec spotifyctl.sh play --open\n# show art/name/artist in notify\nbindsym F5 exec spotifyctl.sh notify" >> $config_path
