#!/bin/bash

EXCLUDE='(\.git/)|(addfile\.sh)|(makelinks\.sh)|(mapping)|(README)|(\.swp$)'
f_count=`find -type f | grep -vP $EXCLUDE | wc -l`

echo -e "\e[1;32mThis script will replace the following files with symlinks:\e[00m"

for (( i=1; i<=$f_count; i++ ))
do
    f_curr_alias=`find -type f | grep -vP $EXCLUDE | head -n $i | tail -n 1 | cut -c 3-`
    f_curr=`cat mapping | grep $f_curr_alias | grep -Po ';.*$' | grep -Po '[^;]*'`
    if ! [ -h $f_curr ] # assuming no one else made config files symlinks for some reason
    then
        echo -e "${f_curr_alias}: ${f_curr}"
    fi
done

validinput=0
while [ $validinput -ne 1 ]
do
    echo -en "\e[1;32mContinue? [y/N]\e[00m "
    read choice
    case "$choice" in
        "y" )
            validinput=1
            cont=1;;
        "Y" )
            validinput=1
            cont=1;;
        "n" )
            validinput=1
            cont=0;;
        "N" )
            validinput=1
            cont=0;;
        "" )
            validinput=1
            cont=0;;
        * )
            validinput=0;;
    esac
done

if [ $cont -eq 1 ]
then
    for (( i=1; i<=$f_count; i++ ))
        do
            f_curr_alias=`find -type f | grep -vP $EXCLUDE | head -n $i | tail -n 1 | cut -c 3-`
            f_curr=`cat mapping | grep $f_curr_alias | grep -Po ';.*$' | grep -Po '[^;]*'`
            if ! [ -h $f_curr ]
            then
                rm -f $f_curr
                ln -s "${PWD}/${f_curr_alias}" $f_curr
            fi
        done
    echo -e "\e[1;32mDone. :)\e[00m "
fi
