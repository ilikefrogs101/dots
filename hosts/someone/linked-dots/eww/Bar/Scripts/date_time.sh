#!/usr/bin/env sh

DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ $(eww --config $DIR/.. get use_kaktovic_numerals) == true ]]
then
    echo "$(date '+%Y-%m-%d %X' | /home/ilikefrogs101/Documents/Projects/Zig/Kaktovic-Converter/zig-out/bin/Kaktovic-Converter)"
else
    echo "$(date '+%Y-%m-%d %X')"
fi