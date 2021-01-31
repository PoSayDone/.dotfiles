#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi/applets/android"
rofi_command="rofi -theme $dir/three.rasi"

# Error msg
msg() {
	rofi -theme "$dir/message.rasi" -e "Please install 'escrotum' first."
}

# Options
screen=""
area=""
window=""

# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -p '' -dmenu -selected-row 1)"
case $chosen in
    $screen)
		if [[ -f /usr/bin/escrotum ]]; then
			escrotum 'screenshot_%Y%m%d_%H%M%S.png' -e 'mkdir -p ~/Pictures/Screenshots && mv $f ~/Pictures/Screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/Screenshots/`ls -1 -t ~/Pictures/Screenshots | head -1`' # All screens
		else
			msg
		fi
        ;;
    $area)
		if [[ -f /usr/bin/escrotum ]]; then
			escrotum -s 'screenshot_%Y%m%d_%H%M%S.png' -e  'mkdir -p ~/Pictures/Screenshots && mv $f ~/Pictures/Screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/Screenshots/`ls -1 -t ~/Pictures/Screenshots | head -1`'
		else
			msg
		fi
        ;;
    $window)
		if [[ -f /usr/bin/escrotum ]]; then
			 escrotum -x 'screenshot_%Y%m%d_%H%M%S.png' -e  'mkdir -p ~/Pictures/Screenshots && mv $f ~/Pictures/Screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/Screenshots/`ls -1 -t ~/Pictures/Screenshots | head -1`'
		else
			msg
		fi
        ;;
esac

