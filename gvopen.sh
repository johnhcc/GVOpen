#!/bin/bash
#
# GVOpen 2.2
#
# 2010/11/11  Written by John M. Haynes (https://github.com/johnhcc)
# 2012/08/23  Updated to use local environment
# 2020/11/29  Simplifications and removal of GhostScript testing

# GV command

gv_cmd="gv"

# Set multi to 0 to open new GV instance for each ps/eps file

multi=0

# Applescript command to display warning dialog. In recent versions of
# macOS this will trigger a warning itself.

gv_dialog='tell app "Finder" to display dialog "GVOpen was unable to find '\
'\"gv\". Open Terminal and make sure the \"gv\" binary is in your path, '\
'and that GV opens when you type \"gv\" followed by enter." buttons "Ok" '\
'with title "GVOpen"'

# Test if GV is present

cmd=$(/usr/bin/command -v $gv_cmd)
if [ $? -ne 0 ]; then
    /usr/bin/osascript -e "$gv_dialog"
    exit 1
fi

# Read optional switches, if present

if [ -r ~/.gvopen ]; then
    opt_switches=( $( /bin/cat ~/.gvopen ) )
else
    opt_switches=""
fi

# Start gv

if [ $multi = -1 ] || [ $# = 0 ]; then
    if [ "${opt_switches[0]}"  != "" ]; then
        /bin/bash -c "$cmd "' "$@"' 0 "${opt_switches[@]}" &
    else
        /bin/bash -c "$cmd" &
    fi
elif [ $multi = 0 ]; then
    for arg in "$@"; do
        if [ "${opt_switches[0]}"  != "" ]; then
            /bin/bash -c "$cmd "' "$@"' 0 "${opt_switches[@]}" "$arg" &
        else
            /bin/bash -c "$cmd "' "$@"' 0 "$arg" &
        fi
    done
fi
