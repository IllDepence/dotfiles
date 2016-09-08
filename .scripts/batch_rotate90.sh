#!/bin/sh

for arg in "$@"
do
    convert "${arg}" -rotate 90 "${arg}"
done
