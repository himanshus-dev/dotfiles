#!/bin/bash

#######################################
#          tmux setup script          #
# ----------------------------------- #
# This installs required plugings and #
# sets the conf file to your home dir #
# ----------------------------------- #
#       Author : Himanshu Sharma      #
#   Email: path2himanshu@gmail.com    #
#######################################

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) && cd "$SCRIPT_DIR" || return 1

echo "SetupBot=> Setting tmux config, Master"

# backup existing conf -- if exists
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf ~/.tmux.conf.bak

# create a symlink to conf
ln -sf "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf


echo "SetupBot=> Getting your plugings, Master"

[[ ! -a ~/.tmux/plugins/tpm ]] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tpm - tmux plugin manager is
[[ ! -a ~/.tmux/plugins/tmux-yank ]] && git clone https://github.com/tmux-plugins/tmux-yank.git ~/.tmux/plugins/tmux-yank
[[ ! -a ~/.tmux/plugins/tmux-sensible ]] && git clone https://github.com/tmux-plugins/tmux-sensible.git ~/.tmux/plugins/tmux-sensible
[[ ! -a ~/.tmux/plugins/tmux-resurrect ]] && git clone https://github.com/tmux-plugins/tmux-resurrect.git ~/.tmux/plugins/tmux-resurrect
[[ ! -a ~/.tmux/plugins/tmux-continuum ]] && git clone https://github.com/tmux-plugins/tmux-continuum.git ~/.tmux/plugins/tmux-continuum
[[ ! -a ~/.tmux/plugins/tmux-power ]] && git clone https://github.com/wfxr/tmux-power.git ~/.tmux/plugins/tmux-power
[[ ! -a ~/.tmux/plugins/tmux-net-speed ]] && git clone https://github.com/wfxr/tmux-net-speed.git ~/.tmux/plugins/tmux-net-speed
[[ ! -a ~/.tmux/plugins/tmux-prefix-highlight ]] && git clone https://github.com/wfxr/tmux-prefix-highlight.git ~/.tmux/plugins/tmux-prefix-highlight

echo "SetupBot=> I'm done, Master"
