<h1 align="center">Spotifyctl</h1>

<!-- BADGES -->
</br>

<p align="center">
  <img src="https://img.shields.io/github/issues/MaxProger338/spotifyctl?style=for-the-badge">
  <img src="https://img.shields.io/github/repo-size/MaxProger338/spotifyctl?style=for-the-badge">
  </br>
</p>

<!-- ABOUT -->
<h2 align="left"> :blue_book: Информация</h2>

### [English](../README.md) | **Русский**

__I позаимствовал сам скрипт (spotifyctl.sh)__ у [Wandernauta](https://gist.github.com/wandernauta/6800547), но **Я написал вывод информации о треке через уведомление (dunst)**.

<!-- FEATURES -->
## 🚀 Возможности
* ***Воспроизведение/пауза*** музыкы
* ***След/пред*** музыка
* ***Показать арт/название песни/исполнителя*** в dunst-уведомлении
* ...

<!-- PREVIEW -->
## 🖼️ Картинки (Уведомления)
![preview](assets/preview/2.png)
![preview](assets/preview/3.png)
**Not customizised dunst**
![preview](assets/preview/1.png)

<!-- HOW DOES IT WORK -->
## 💻 Как это работает
Чтобы *отправить уведомление*, вам необходимо **выполнить notify-spotify-music.sh**. Он будет выполнять вспомогательные скрипты в следующем порядке: 
- **download-track-logo** - Скачивает арт по его URL в /tmp/spotify-logos (если он уже был скачен, он не будет скачиваться снова)
- **to-svg.sh** - Конвертирует полученный логотип в SVG *(т.к. Dunst принимает изображения только в .svg формате)*

<!-- DEPENDENCIES -->
## 🗿 Зависимости

- [Inkscape](https://inkscape.org/) - Он используется для конвертации в SVG

<!-- INSTALLITION -->
## 📘 Installition

1. **Установка Inkscape** (Для конвертации)
```bash
pacman -S inkscape 
```
2. **Клонируем репо**
```bash
git clone https://github.com/MaxProger338/spotifyctl
cd spotifyctl
```
3. **Копирование всех скриптов в каталог** (рекомендуется `~/.local/bin/`)
```bash
cp src/spotifyctl.sh ~/.local/bin
cp src/notify/* ~/.local/bin
```
4. **ОПЦИОНАЛЬНО: привязка их к клавиатуре** 

> [!TIP]
> Я использую i3 под Xorg, поэтому мне следует привязывать их в `~/.config/i3/config`.

```bash
#--- SPOTIFY ------------------------------------
bindsym F9 exec ~/.local/bin/spotifyctl.sh next
bindsym F8 exec "~/.local/bin/spotifyctl.sh next && \
                 ~/.local/bin/spotifyctl.sh pause"
bindsym F7 exec ~/.local/bin/spotifyctl.sh prev
bindsym F6 exec ~/.local/bin/spotifyctl.sh play
bindsym F5 exec ~/.local/bin/notify-spotify-music.sh
```