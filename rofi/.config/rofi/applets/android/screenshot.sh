#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi/applets/android"
rofi_command="rofi -theme $dir/three.rasi"

# Error msg
msg() {
	rofi -theme "$dir/message.rasi" -e "Please install 'scrot' first."
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
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot 'screenshot_%Y%m%d_%H%M%S.png' -e 'mkdir -p ~/Изображения/Скриншоты && mv $f ~/Изображения/Скриншоты && xclip -selection clipboard -t image/png -i ~/Изображения/Скриншоты/`ls -1 -t ~/Изображения/Скриншоты | head -1`' # All screens 
		else
			msg
		fi
        ;;
    $area)
		if [[ -f /usr/bin/scrot ]]; then
			scrot -s 'screenshot_%Y%m%d_%H%M%S.png' -e  'mkdir -p ~/Изображения/Скриншоты && mv $f ~/Изображения/Скриншоты && xclip -selection clipboard -t image/png -i ~/Изображения/Скриншоты/`ls -1 -t ~/Изображения/Скриншоты | head -1`'		
		else
			msg
		fi
        ;;
    $window)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot -u 'screenshot_%Y%m%d_%H%M%S.png' -e  'mkdir -p ~/Изображения/Скриншоты && mv $f ~/Изображения/Скриншоты && xclip -selection clipboard -t image/png -i ~/Изображения/Скриншоты/`ls -1 -t ~/Изображения/Скриншоты | head -1`'		
		else
			msg
		fi
        ;;
esac

