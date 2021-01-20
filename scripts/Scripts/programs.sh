exec xset r rate 300 50 &
exec picom &
setxkbmap -layout 'us,ru' -option 'grp:alt_shift_toggle,grp_led:scroll' &
xinput --set-prop 13 'libinput Accel Speed' -0.9 &
exec polybar wpgtk &
exec discord &
exec telegram-desktop &
exec firefox
