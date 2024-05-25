#!/usr/bin/env sh

DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ $(eww --config $DIR/.. get use_kaktovic_numerals) == true ]]
then
    echo "$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }' | sed s/%// | /home/ilikefrogs101/Documents/Projects/Zig/Kaktovic-Converter/zig-out/bin/Kaktovic-Converter)"
else
    echo "$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }')"
fi