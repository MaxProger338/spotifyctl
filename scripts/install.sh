#!/bin/sh

#--- Constants ------------
dir=~/.local/bin/

#--- Colors --------------
RED="\033[31m"
NC="\033[0m"

[[ $(command -v git) = "" ]] && echo -e "${RED}git not found${NC}" 1>&2 && exit 1
[[ "$PWD" = "$dir" ]]        && echo -e "${RED}Please, change the directory {recomend~}${NC}" && exit 2;

git clone https://github.com/MaxProger338/spotifyctl
# Creating a output dir
mkdir -p "$dir/spotifyctl"
# Copying all files from scr/ to a output dir 
cp -r spotifyctl/src/* "$dir/spotifyctl"

# Removing a repo
rm -rf spotifyctl

#--- Creating symlink to spotifyctl.sh -------------
ln -s "$dir/spotifyctl/spotifyctl.sh" "$dir/spotifyctl.sh"
