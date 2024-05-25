#!/usr/bin/env sh

DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ $(eww --config $DIR/.. get use_kaktovic_numerals) == true ]]
then
    echo "$(df -H / | grep /dev/ | awk '{print $2}' | sed s/G//g | /home/ilikefrogs101/Documents/Projects/Zig/Kaktovic-Converter/zig-out/bin/Kaktovic-Converter)"
else
    echo "$(df -H / | grep /dev/ | awk '{print $2}' | sed s/G//g)G"
fi