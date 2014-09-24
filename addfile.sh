#!/bin/bash

cp $1 "${PWD}/${2}"
echo "adding ${1} as ${2}"
echo "${2};${1}" >> mapping
