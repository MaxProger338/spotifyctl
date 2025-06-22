#!/bin/sh

#--- Constants ----------
controller=~/.local/bin/spotifyctl/units/controller/dbus-controller.sh
notify=~/.local/bin/spotifyctl/units/notify/notify.sh
spotify=/usr/bin/spotify-launcher
# Because after opening, the contoller needs a timeout that Spotify has time to load
timeout_after_spotify_opening=1
dunst_delay=3000

#--- Errors ----------
CONTROLLER_MODULE_NOT_FOUND=1
NOTIFY_MODULE_NOT_FOUND=2
SPOTIFY_NOT_FOUND=3
SPOTIFY_NOT_RUNNING=4
CHOOSE_ACTION=5
UNKOWN_ACTION=6
DUNST_NOT_RUNNING=7
DUNST_NOT_RUNNING=8

#--- FOUNDING MODULES -----------
# If any script doesn't exist - exit with error
[[ $(command -v "$controller") = "" ]] && echo "Error: Controller module ${controller} not found" && exit $CONTROLLER_MODULE_NOT_FOUND
[[ $(command -v "$notify")     = "" ]] && echo "Error: Notify module ${notify} not found" && exit $NOTIFY_MODULE_NOT_FOUND
[[ $(command -v "$spotify")    = "" ]] && echo "Error: Spotify ${notify} not found" && exit $SPOTIFY_NOT_FOUND

#--- SPOTIFY --------------------
# Checking, is Spotify running?
"$controller" 2>&1 > /dev/null
[[ "$?" -eq 0 ]] && spotify_running=true || spotify_running=false

open_spotify="$2"
if [[ "$open_spotify" = "--open" ]] then
	if [[ "$spotify_running" = false ]] then
		("$spotify" 2>&1) > /dev/null & 
		sleep "$timeout_after_spotify_opening"
	fi
else
	[[ "$spotify_running" = false ]] && dunstify "Spotify not running" && exit $SPOTIFY_NOT_RUNNING
fi

function notify {
	[[ $(command -v dunstify) = "" ]] && echo "Error: dunstify not found"  1>&2 && exit $DUNST_NOT_FOUND
	[[ -z "$(pgrep dunst)" ]] && echo "Error: Dunst isn't running" && exit $DUNST_NOT_RUNNING
 
	title=$( "$controller" eval | grep -oP 'SPOTIFY_TITLE="\K[^"]+')
	artist=$("$controller" eval | grep -oP 'SPOTIFY_ARTIST="\K[^"]+')
	album=$( "$controller" eval | grep -oP 'SPOTIFY_ALBUM="\K[^"]+')	
	url=$("$controller" metadata | grep 'artUrl' | cut -d '|' -f 2)
	
	# Start script
	("$notify" "$title" "$artist" "$album" "$url" "$dunst_delay" 2>&1)
}

#==================== Actions =====================
action="$1"
[[ -z "$action" ]] && echo "Error: Choose the action" && exit $CHOOSE_ACTION;

case "$action" in
	"play")
		"$controller" play
		;;
	"pause")
		"$controller" pause
		;;
	"prev")
		"$controller" prev
		;;
	"next")
		"$controller" next
		;;
	"next-pause")
		"$controller" next && "$controller" pause
		;;
	"notify")
		notify
		;;	
	*)
		echo "Error: Unkown action" && exit $UKNOW_ACTION;
esac
