#!/usr/bin/env sh

DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ $(eww --config $DIR/.. get use_kaktovic_numerals) == true ]]
then
    cat /sys/class/power_supply/BAT0/capacity | /home/ilikefrogs101/Documents/Projects/Zig/Kaktovic-Converter/zig-out/bin/Kaktovic-Converter
else
    echo "$(cat /sys/class/power_supply/BAT0/capacity)%"
fi