#!/bin/sh

#--- Constants ------------
dir=~/.local/bin/spotifyctl

#--- Colors --------------
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[34m"
GREEN="\033[32m"
NC="\033[0m"

#--- Installing ------------
[[ $(command -v git) = "" ]] && echo -e "${RED}git not found${NC}" 1>&2 && exit 1
[[ "$PWD" != "$HOME" ]]      && echo -e "${RED}Please, change the directory to ${HOME}${NC}" && exit 2
[[ -d "$dir" ]]              && echo -e "${RED}Please, remove ${dir}${NC}" && exit 3

echo -e "${BLUE}Clonning the repo...${NC}"
(git clone https://github.com/MaxProger338/spotifyctl 2>&1) > /dev/null
error="$?"
if [[ "$error" -ne 0 ]] then
	echo -e "${RED}Git clonning error ${error}${NC}"
	exit "$error"
fi
echo -e "${GREEN}Success${NC}"

echo -e "${BLUE}Creating output dir...${NC}"
mkdir -p "$dir"
echo -e "${GREEN}Success${NC}"

echo -e "${BLUE}Copy all files to the output dir...${NC}"
cp -r spotifyctl/src/* "$dir"
echo -e "${GREEN}Success${NC}"

echo -e "${BLUE}Removing the donwloaded repo...${NC}"
rm -rf spotifyctl
echo -e "${GREEN}Success${NC}"

#--- Connecting :) -------------
echo -e "${BLUE}Creating symlink...${NC}"
ln -sf "$dir/spotifyctl.sh" "$dir/../spotifyctl.sh"
echo -e "${GREEN}Success${NC}"

[[ "$(command -v spotifyctl.sh)" = "" ]] && echo -e "${YELLOW}Please, add ~/.local/bin/ to \$PATH so you could run him${NC}" || echo -e "${GREEN}Well done!${NC}"
