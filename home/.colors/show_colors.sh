#!/bin/bash
 
# The syntax for escaped color sequences looks like:
#
#    BLUE="\[\033[0;34m\]"
#
# Lets see what we can find...
 
NONE="\033[0m"
 
for COLOR in $(seq 30 40) ; do
    for STYLE in $(seq 0 1) 4 5 7; do
        TAG="\033[${STYLE};${COLOR}m"
        STR="Color:${COLOR}--Style:${STYLE}"
 
        echo -ne "${TAG}${STR}${NONE}  "
    done
    echo
done
