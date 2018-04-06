#!/bin/bash
rand=$(find ~/Pictures -maxdepth 1 -type f | shuf -n 1)

feh --bg-scale $rand
