#!/usr/bin/env sh

if [[ $(eww --config ~/.config/eww/Bar/ get use_kaktovic_numerals) == true ]]
then
    echo "$(free --human --si | grep Mem | awk '{printf $3}' | sed s/G//g | /home/ilikefrogs101/Documents/Projects/Zig/Kaktovic-Converter/zig-out/bin/Kaktovic-Converter)"
else
    echo "$(free --human --si | grep Mem | awk '{printf $3}')"
fi