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

exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
exec bspwm &
exec sxhkd &
exec xset r rate 300 50 &
exec picom &
setxkbmap -layout 'us,ru' -option 'grp:alt_shift_toggle,grp_led:scroll' &
xinput --set-prop 13 'libinput Accel Speed' -0.9 &
exec polybar wpgtk &
exec discord &
exec telegram-desktop &
exec firefox &
exec kitty &
exec spotify
