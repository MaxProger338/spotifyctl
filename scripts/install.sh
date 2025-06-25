#!/bin/sh

#--- Constants ------------
dir=~/.local/bin/spotifyctl

#--- Colors --------------
RED="\033[31m"
YELLOW="\033[33m"
NC="\033[0m"

#--- Installing ------------
[[ $(command -v git) = "" ]] && echo -e "${RED}git not found${NC}" 1>&2 && exit 1
[[ "$PWD" != "$HOME" ]]      && echo -e "${RED}Please, change the directory to ${HOME}${NC}" && exit 2
[[ -d "$dir" ]]              && echo -e "${RED}Please, remove ${dir}${NC}" && exit 3

git clone https://github.com/MaxProger338/spotifyctl
# Creating a output dir
mkdir -p "$dir"
# Copying all files from scr/ to a output dir 
cp -r spotifyctl/src/* "$dir"
# Removing a repo
rm -rf spotifyctl

#--- Connecting :) -------------
ln -sf "$dir/spotifyctl/spotifyctl.sh" "$dir/spotifyctl.sh"

[[ $(command -v spotifyctl.sh) = "" ]] && echo -e "${YELLOW}Please, add ~/.local/bin/ to \$PATH so you could run him${NC}"
