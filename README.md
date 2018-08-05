# About all

This is my utils scripts and config files

# Printer

## Arch

Install the [CUPS](https://wiki.archlinux.org/index.php/CUPS#Configuration) to manager sources printers and [Avahi](https://wiki.archlinux.org/index.php/Avahi) to find networks printers.

Start both services.

***Samsung***

Install the driver from site or install the [Samsung undefied
driver](https://wiki.archlinux.org/index.php/CUPS/Printer-specific_problems#Samsung) from [AUR](https://aur.archlinux.org/packages/samsung-unified-driver/).

Then go in CUPS administration http://localhost:631/ click in add printers. Do
the loggin as as ***root*** or a user with permission to manage printers. Add
the printer and use default options.

![Drive printer selection](samsung_printer.png)

# OS configuration

This section is to link with others instructions for OS customization

## Wallpaper background

Install the [Feh](https://wiki.archlinux.org/index.php/feh) and create the
script of wallpaper. Then set it in profile initialization.

[Wallpaper](i3/wallpaper.sh)

## Base alias

This is the base alias commands.

[Aliases](.bash_alias)

## Bash utils

The script [bash utils](.bash_utils) has some utils functions to bash:

* se and searchenvdir: search for a virtual env from / to current dir
* extract: base function to extract data from some compressed files
* _git: show current branch to print in PS1
* _env: show .pyenv name to print in PS1
* calc: command line calculator using python or awk. To use '()' is necessary quotations ""

# I3

The [i3 folder](i3) contains configuration file to i3 window manager. To use it, copy the entire folder to `$HOME/.config/`.

# Utils packages

## Pacman

* [xorg-xprop](https://www.x.org/releases/X11R7.5/doc/man/man1/xprop.1.html):
  property displayer for X, helps to find information about windows. Used
  identify WM_NAME for bind window with workspace in i3.
* [xorg-xbacklight](https://www.x.org/archive/X11R7.5/doc/man/man1/xbacklight.1.html): adjust backlight brightness using RandR extension. Used: change intesity of monitor light.
* [playerctl](https://github.com/acrisci/playerctl): mpris command-line controller and library for spotify, vlc, audacious, bmp, xmms2, and others. Used: control music in i3blocs and polybar.
* bash-completion
* [qbittorrent](https://www.qbittorrent.org/): torrent client. Used: download
  torrents. :)
* [feh](https://feh.finalrewind.org/): is an X11 image viewer, simply displays images. Used: view images and set background ramdomly.

## Yaourt

* [polybar](https://github.com/jaagr/polybar): A fast and easy-to-use tool for creating status bars. Used: pretty bar.
* [rofi](https://github.com/DaveDavenport/rofi):  A window switcher, application launcher and dmenu replacement. Used: lauch applications in i3.


## Pip

* [grip](https://github.com/joeyespo/grip): Preview GitHub Markdown files like Readme locally before committing them.
