# [i3 wm](https://i3wm.org/)

I3 wm is a simple and lightweight window manager

![i3wm](https://i3wm.org/screenshots/i3-9.bigthumb.png)

Image from site i3wm

# Init i3wm

To execute i3wm, use the follow code in .xinitrc.

```
numlockx &

xautolock -time 15 -nowlocker "$HOME/.config/i3/i3exit.sh lock" -locker "$HOME/.config/i3/i3exit.sh suspend" -notify 30 -notifier "i3-nagbar -m 'Computer was suspended'" &

$HOME/.config/i3/i3exit.sh lock

$HOME/.config/i3/wallpaper.sh 600 &

exec i3
```



# Polybar

Polybar is an highly customizable status bar. It used with i3wm to provide few
informations about the system, windows and useful menus.

The bar is defined as bar/status. To lauch polybar in i3, add the script
[launch](launch_polybar.sh) in configuration file of i3. Use the flag -c to
indicate where is the [polybar configuration](polybar). Using this configuration
file, will generate the following bar.

**Polybar used modules**

* module/xwindow: native module
* module/i3: native module
* module/xbacklight: native module
* module/cpu: native module
* module/memory: native module
* module/swap: native module
* module/wlan: native module
* module/eth: native module
* module/date: native module
* module/pulseaudio: native module
* module/battery: native module
* module/cpu-temp: native module
* module/powermenu: custom menu script using [i3exit](i3exit.sh)
* module/mplayer: custom player control using [playerctl](player.sh)
* module/gpu: custom system [NVIDIA GPU](gpu.sh) status

![polybar result](polybarresult.png)

# Wallpaper

To set a specific image to background, use [feh](https://feh.finalrewind.org/).

```
feh --bg-fill --randomize ~/.wallpapers/*
```


To change the background every X times, use the [wallpaper](wallpaper.sh) script.

```
~/.config/i3/wallpaper.sh X &
```

To execute it every time the i3wm starts, add it in .xinitrc

# Autolock

[Xautolock](https://linux.die.net/man/1/xautolock) is a program that fire others programs after X times. Use it to lock
your screen or suspend the notebook. Use i3-nagbar to notify the action. Use the
[i3exit](i3exit.sh) to manager the actions.

```
xautolock -time 15 \
  -nowlocker "$HOME/.config/i3/i3exit.sh lock" \
  -locker "$HOME/.config/i3/i3exit.sh suspend" \
  -notify 30 -notifier "i3-nagbar -m 'Computer was suspended'"
```

To disable the current xautolock ```xautolock -disable``` and ```xautolock
-enable``` to enable it. It's useful when whatching movies, animes, series.
