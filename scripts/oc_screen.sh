#! /bin/bash

width=2560
height=1080
freq=74

name=${width}x${height}_${freq}.00

test -n "`xrandr | grep $name`" && exit 1

output=`xrandr | awk '/ connected/{print $1}' | head -1`

mode=`cvt $width $height $freq | grep Modeline | sed 's/Modeline //;s/"//g'`

xrandr --newmode $mode
xrandr --addmode $output $name
xrandr --output  $output --mode $name
