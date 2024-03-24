#!/bin/bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

killall -v xcape
setxkbmap -option 'caps:ctrl_modifier' && xcape -e 'Caps_Lock=Escape' &
