#!/bin/sh

if [ ${#@} -eq "0" ]
    then
    ls /dev | grep sd
    exit 0
fi

for arg in "$@"
do
    if [ ${#arg} -eq "1" ]
        then
        dir="sd${arg}1"
    elif [ ${#arg} -eq "2" ]
        then
        dir="sd${arg}"
    else
        echo "unexpected parameter: ${arg}"
        exit 0
    fi
    if [ ! -d "/mnt/${dir}" ]; then
        sudo mkdir "/mnt/${dir}"
    fi
    echo "mounting /dev/${dir} to /mnt/${dir}"
    sudo mount "/dev/${dir}" "/mnt/${dir}"
done
