#!/bin/bash

moz=~/.mozilla/firefox

if [[ -d $moz ]]
then
    for d in "$moz"/*.default
    do
        [[ -d $d ]] && mkdir "$d"/chrome
    done
fi
