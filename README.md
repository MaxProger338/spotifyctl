<h1 align="center">Spotifyctl</h1>

<!-- BADGES -->
</br>
<p align="center">
  <img src="https://img.shields.io/github/issues/MaxProger338/spotifyctl?style=for-the-badge">
  <img src="https://img.shields.io/github/repo-size/MaxProger338/spotifyctl?style=for-the-badge">
</p>
<p align="center">
  <img src="https://img.shields.io/github/downloads/MaxProger338/spotifyctl/total">
</p>

<!-- ABOUT -->
<h2 align="left"> :blue_book: About</h2>

### **English** | [Русский](docs/README_RU.md)

__Stoled it as is__ (from [Wandernauta](https://gist.github.com/wandernauta/6800547)), __screwed dunst__ to output the current track. It works – *and that's fine*.

<!-- FEATURES -->
## 🚀 Features
* ***Play/pause*** music
* ***Next/prev*** music
* ***Show art/song name/artist*** in a dunst-notify
* ...

<!-- PREVIEW -->
## 🖼️ Preview (Show notify)
![preview](docs/assets/preview/2.png)
![preview](docs/assets/preview/3.png)
**Not customizised dunst**
![preview](docs/assets/preview/1.png)

<!-- HOW DOES IT WORK -->
## 💻 How does it work 
To *send a notification*, you need to **execute the notify-spotify-music.sh**.
It will execute the helper scripts in the following order:

- **download-track-logo** - Downloads the art from its URL in ~/.tmp/spotify-logos (if it has already been downloaded, it will not be downloaded again)
- **to-svg.sh** - Converts the resulting logo to SVG *(because Dunst only accepts images in a .svg format)*; (if it has already been converted, it will not be converted again)


<!-- DEPENDENCIES -->
## 🗿 Dependencies

- [Inkscape](https://inkscape.org/) - It is used to convert to SVG

<!-- INSTALLITION -->
## Autoinstall

**To simply install him, copy and paste it to your terminal:**
```bash
sh -c "$(wget https://raw.githubusercontent.com/MaxProger338/spotifyctl/refs/heads/main/scripts/install.sh -O -)"
```

**To bind him to i3:**
```bash
sh -c "$(wget https://raw.githubusercontent.com/MaxProger338/spotifyctl/refs/heads/main/scripts/bind_i3.sh -O -)"
```

## 📘 Manual Installition

1. **Installing Inkscape** (for convert)
```bash
pacman -S inkscape 
```
2. **Coping a repo**
```bash
git clone https://github.com/MaxProger338/spotifyctl
cd spotifyctl
```
3. **Coping all scripts to a dir** (recomend `~/.local/bin/spotifyctl`)
```bash
mkdir -p ~/.local/bin/spotifyctl
cp -r src/* ~/.local/bin/spotifyctl
```
4. **OPTIONAL: binding them to the keyboard** 

> [!TIP]
> I use i3 under Xorg, so I should bind them in `~/.config/i3/config`.

```bash
#--- SPOTIFY ------------------------------------
# play next
bindsym F9 exec ~/.local/bin/spotifyctl/spotifyctl.sh next
# next and pause
bindsym F8 exec "~/.local/bin/spotifyctl/spotifyctl.sh next && \
                 ~/.local/bin/spotifyctl/spotifyctl.sh pause"
# play prev
bindsym F7 exec ~/.local/bin/spotifyctl/spotifyctl.sh prev
# play/pause
bindsym F6 exec ~/.local/bin/spotifyctl/spotifyctl.sh play
# show art/name/artist in notify
bindsym F5 exec ~/.local/bin/spotifyctl/notify-spotify-music.sh
```

<!-- USAGE -->
## Usage

**Just run the script** with the appropriate parameters ***(spotifyctl.sh)***:

- **next** - play next track
- **prev** - play prev track
- **pause** - only pause the track
- **play** - play/pause the track
- **metadata** - dump the current track's metadata
- **current** - show the currently track
- **eval** - return the metadata as a shell script

**A different script is used for notifications**. Just run it and everything will work right away.
