#!/bin/bash

#while true
#do

x=`xset q | grep -Po 'Caps Lock:\s+(on|off)' | grep -Po '\S+$'`
case $x in
	on )
	state="kana" ;;
	off )
	state="romaji" ;;
esac
echo -e "${state}"

#sleep 1

#done
