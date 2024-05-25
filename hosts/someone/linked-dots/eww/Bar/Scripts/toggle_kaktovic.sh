#!/usr/bin/env sh

DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ $(eww --config $DIR/.. get use_kaktovic_numerals) == true ]]
then
    eww --config $DIR/.. update use_kaktovic_numerals=false
else
    eww --config $DIR/.. update use_kaktovic_numerals=true
fi

eww --config $DIR/.. update date_time_poll="$($DIR/date_time.sh)"
eww --config $DIR/.. update battery_capacity_poll="$($DIR/battery_capacity.sh)"
eww --config $DIR/.. update disk_used_poll="$($DIR/disk_used.sh)"
eww --config $DIR/.. update disk_total_poll="$($DIR/disk_total.sh)"
eww --config $DIR/.. update cpu_poll="$($DIR/cpu.sh)"
eww --config $DIR/.. update memory_used_poll="$($DIR/memory_used.sh)"
eww --config $DIR/.. update memory_total_poll="$($DIR/memory_total.sh)"
eww --config $DIR/.. update network_strength_poll="$($DIR/network_strength.sh)"
eww --config $DIR/.. update private_ip_poll="$($DIR/private_ip.sh)"