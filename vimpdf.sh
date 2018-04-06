#!/bin/bash

file="$1"

pandoc -o "$file.pdf" $file
mupdf "$file.pdf" &
