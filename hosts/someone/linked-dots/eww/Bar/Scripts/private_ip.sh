#!/usr/bin/env sh

DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ $(eww --config $DIR/.. get use_kaktovic_numerals) == true ]]
then
    echo "$(ip addr show | grep inet | grep -v 127.0.0.1 | awk '{print $2}' | cut -d '/' -f1 | sed -n '2p' | /home/ilikefrogs101/Documents/Projects/Zig/Kaktovic-Converter/zig-out/bin/Kaktovic-Converter)"
else
    echo "$(ip addr show | grep inet | grep -v 127.0.0.1 | awk '{print $2}' | cut -d '/' -f1 | sed -n '2p')"
fi