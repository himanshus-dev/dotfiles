#/usr/bin/env bash

ROFI_DIR="$HOME/dotfiles/rofi"

# Rofi theme to use
use_theme="$ROFI_DIR/themes/confirm.rasi"

# Look for arguments
while getopts o:p:w: flag
do
    case "${flag}" in
        o) options=${OPTARG};;
        p) prompt=${OPTARG};;
        w) width=${OPTARG};;
    esac
done

# Use default values no args provided
if [[ ! $prompt ]]; then
	prompt="Are you sure?"
fi

if [[ ! $options ]]; then
	options="Yes\nNo"
fi

# Show the dialog
chosen=$(echo -e "${options}"| rofi -theme $use_theme -dmenu -i -p "${prompt}")

# Return response
echo $chosen