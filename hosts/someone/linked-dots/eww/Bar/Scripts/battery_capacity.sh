#!/usr/bin/env sh

if [[ $(eww --config ~/.config/eww/Bar/ get use_kaktovic_numerals) == true ]]
then
    cat /sys/class/power_supply/BAT0/capacity | /home/ilikefrogs101/Documents/Projects/Zig/Kaktovic-Converter/zig-out/bin/Kaktovic-Converter
else
    echo "$(cat /sys/class/power_supply/BAT0/capacity)%"
fi