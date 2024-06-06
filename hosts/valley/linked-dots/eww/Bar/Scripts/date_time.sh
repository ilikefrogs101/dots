#!/usr/bin/env sh

if [[ $(eww --config ~/.config/eww/Bar/ get use_kaktovic_numerals) == true ]]
then
    echo "$(date '+%Y-%m-%d %X' | /home/ilikefrogs101/Documents/Projects/Zig/Kaktovic-Converter/zig-out/bin/Kaktovic-Converter)"
else
    echo "$(date '+%Y-%m-%d %X')"
fi