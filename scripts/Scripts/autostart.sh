#!/bin/sh

if ps ax | grep -v grep | grep polybar bspwm> /dev/null
then
    echo "polybar service running, everything is fine"
else
   	exec polybar bspwm &
fi

if ps ax | grep -v grep | grep polybar bottom> /dev/null
then
    echo "polybar service running, everything is fine"
else
   	exec polybar bottom &
fi

if ps ax | grep -v grep | grep polybar time> /dev/null
then
    echo "polybar service running, everything is fine" else
   	exec polybar time &
fi

if ps ax | grep -v grep | grep polybar tray> /dev/null
then
    echo "polybar service running, everything is fine"
else
   	exec polybar tray &
fi

if ps ax | grep -v grep | grep discord > /dev/null

then
    echo "discord service running, everything is fine"
else
    exec discord &
fi

if ps ax | grep -v grep | grep kotatogram-desktop > /dev/null
then
    echo "telegram-desktop service running, everything is fine"
else
    exec kotatogram-desktop &
fi

if ps ax | grep -v grep | grep firefox > /dev/null
then
    echo "firefox service running, everything is fine"
else
    exec firefox &
fi

if ps ax | grep -v grep | grep '/opt/spotify/spotify' > /dev/null
then
    echo "spotify service running, everything is fine"
else
    exec spotify &
fi

if ps ax | grep -v grep | grep lutris > /dev/null
then
    echo "lutris service running, everything is fine"
else
    exec lutris &
fi

if ps ax | grep -v grep | grep picom > /dev/null
then
    echo "picom service running, everything is fine"
else
    exec picom &
fi

if ps ax | grep -v grep | grep homepage > /dev/null
then
    echo "homepage service running, everything is fine"
else
    exec python /home/posaydone/Scripts/server.py &
fi

if ps ax | grep -v grep | grep wired > /dev/null
then
    echo "wired service running, everything is fine"
else
    exec wired &
fi

if ps ax | grep -v grep | grep Lf > /dev/null
then
    echo "lf running, everything is fine"
else
    exec kitty --class Lf -e zsh -c 'source ~/.zshrc; lf' &
fi

