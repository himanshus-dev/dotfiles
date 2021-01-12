#/usr/bin/env bash

ROFI_DIR="$HOME/dotfiles/rofi"

# Message
msg() {
	rofi -theme "$ROFI_DIR/themes/message.rasi" -e "No option selected"
}

#  Rofi theme to use
use_theme="$ROFI_DIR/themes/powermenu.rasi"

# Menu options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Confirm Dialog script
confirm_exit="$ROFI_DIR/scripts/confirm_dialog.sh"

# Show these options
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

# What to do (ask user :D) 
action=$(echo -e $options | rofi -theme $use_theme -dmenu -selected-row 2)

opt_yes="﫠 Yes"
opt_no=" No"

case $action in
     $shutdown)
		ans=$($confirm_exit -o "$opt_yes\n$opt_no" -p "Do you wnat to shutdown the computer?")
		if [[ $ans == $opt_yes ]]; then
			systemctl poweroff
		elif [[ $ans == $opt_no ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $reboot)
		ans=$($confirm_exit -o "$opt_yes\n$opt_no" -p "Do you wnat to reboot the computer?")
		if [[ $ans == $opt_yes ]]; then
			systemctl reboot
		elif [[ $ans == $opt_no ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $lock)
		if [[ -f /usr/bin/i3lock ]]; then
			i3lock -S=$(xrandr --listmonitors | awk 'NR==1{ print $2 }') --blur=sigma
		fi
        ;;
    $suspend)
		ans=$($confirm_exit -o "$opt_yes\n$opt_no" -p "Do you wnat to suspend the computer?")
		if [[ $ans == $opt_yes ]]; then
			# mpc -q pause
			# amixer set Master mute
			systemctl suspend
		elif [[ $ans == $opt_no ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $logout)
		ans=$($confirm_exit -o "$opt_yes\n$opt_no" -p "Do you wnat to exit the session?")
		if [[ $ans == $opt_yes ]]; then
			if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
				i3-msg exit
			fi
		elif [[ $ans == $opt_no ]]; then
			exit 0
        else
			msg
        fi
        ;;
esac
