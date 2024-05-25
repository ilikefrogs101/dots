#!/usr/bin/env sh

if [[ $(eww --config ~/.config/eww/Bar/ get use_kaktovic_numerals) == true ]]
then
    echo "$(awk 'NR==3 {print int($3*100/70)}' /proc/net/wireless | /home/ilikefrogs101/Documents/Projects/Zig/Kaktovic-Converter/zig-out/bin/Kaktovic-Converter)"
else
    echo "$(awk 'NR==3 {print int($3*100/70)}' /proc/net/wireless)%"
fi