#!/bin/sh
# shell script to prepend i3status with more stuff

i3status --config ~/.i3/i3status.conf | while :
do
       read line
       echo "KB: `input_state.sh` | $line" || exit 1
done
