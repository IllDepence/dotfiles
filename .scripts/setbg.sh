#!/bin/bash

screen_lines=`xrandr | grep -P "connected [^(]"`
screen_count=`echo "$screen_lines" | wc -l`
files=""

for (( i=1; i<=$screen_count; i++ ))
do
screen_line=`echo "$screen_lines" | head -n $i | tail -n 1`
screen_res=`echo "$screen_line" | grep -Po "\d+x\d+"`
image=`find "/home/tarek/eigenedaten/bilder/wallpaper/$screen_res/" -type f \( -name '*.jpg' -o -name '*.png' -o -name '*.gif' \) ! -path "*/not/*" -print0 | shuf -n1 -z`
files="$files $image"
done

feh --bg-scale $files

# i presume this'll fail when xrandr ouput order doesn't match screen order. but it does for me right now so — meh.
