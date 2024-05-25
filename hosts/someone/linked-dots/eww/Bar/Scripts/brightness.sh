#!/usr/bin/env sh

DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ $(eww --config $DIR/.. get use_kaktovic_numerals) == true ]]
then
    brightnessctl -m | awk -F, '{print substr($4, 0, length($4))}' | sed s/%// | /home/ilikefrogs101/Documents/Projects/Zig/Kaktovic-Converter/zig-out/bin/Kaktovic-Converter
else
    brightnessctl -m | awk -F, '{print substr($4, 0, length($4))}'
fi