#!/usr/bin/env bash
tmp_title=`uuidgen`
youtube-dl -o "${tmp_title}.mp4" "$1"
youtube-dl -f html5-audio-high -o "${tmp_title}.mp3" "$1"
printf '\x00\x00' | dd of="${tmp_title}.mp4" bs=1 count=2 conv=notrunc
title=`youtube-dl --get-title "https://coub.com/view/1jh670"`
ffmpeg -hide_banner -i "${tmp_title}.mp4" -i "${tmp_title}.mp3" -c copy -shortest -movflags faststart "${title}".mp4
rm "${tmp_title}.mp4" "${tmp_title}.mp3"
