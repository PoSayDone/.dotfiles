#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap sysresources=/etc/X11/xinit/.Xresources
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

exec xset r rate 300 50 &
exec xinput --set-prop 'SYNA32A5:00 06CB:CE17 Touchpad' 'libinput Natural Scrolling Enabled' 1 &
exec xinput --set-prop 'SYNA32A5:00 06CB:CE17 Touchpad' 'libinput Accel Speed' -0.1  &
exec xinput --set-prop 'Logitech G102 Prodigy Gaming Mouse' 'libinput Accel Speed' -0.9  &
exec pywalfox start &
exec clight &
exec touchegg &
exec gxkb &
exec udiskie &
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
exec nm-applet &
exec cbatticon &
exec volumeicon &
exec blueman-tray&
exec bspwm &
exec sxhkd

