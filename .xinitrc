#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

source /etc/X11/xinit/xinitrc.d/30-dbus

TZ='Africa/Johannesburg'; export TZ

# Desktop compositor
compton --backend glx --paint-on-overlay --glx-no-stencil --vsync opengl-swc -b -CG

# Keyboard layout
setxkbmap -layout se
setxkbmap -option ctrl:nocaps

xbindkeys
syndaemon -t -k -i 2 -d >>.syndaemon.log

nm-applet &
udiskie &
blueman-applet &

pgrep redshift &> /dev/null || redshift-gtk &> /dev/null &

exec i3
