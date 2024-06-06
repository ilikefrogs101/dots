#!/usr/bin/env sh

if [[ $(eww --config ~/.config/eww/Bar/ get use_kaktovic_numerals) == true ]]
then
    eww --config ~/.config/eww/Bar/ update use_kaktovic_numerals=false
else
    eww --config ~/.config/eww/Bar/ update use_kaktovic_numerals=true
fi

eww --config ~/.config/eww/Bar/ update date_time_poll="$(~/.config/eww/Bar/Scripts/date_time.sh)"
eww --config ~/.config/eww/Bar/ update battery_capacity_poll="$(~/.config/eww/Bar/Scripts/battery_capacity.sh)"
eww --config ~/.config/eww/Bar/ update disk_used_poll="$(~/.config/eww/Bar/Scripts/disk_used.sh)"
eww --config ~/.config/eww/Bar/ update disk_total_poll="$(~/.config/eww/Bar/Scripts/disk_total.sh)"
eww --config ~/.config/eww/Bar/ update cpu_poll="$(~/.config/eww/Bar/Scripts/cpu.sh)"
eww --config ~/.config/eww/Bar/ update memory_used_poll="$(~/.config/eww/Bar/Scripts/memory_used.sh)"
eww --config ~/.config/eww/Bar/ update memory_total_poll="$(~/.config/eww/Bar/Scripts/memory_total.sh)"
eww --config ~/.config/eww/Bar/ update network_strength_poll="$(~/.config/eww/Bar/Scripts/network_strength.sh)"
eww --config ~/.config/eww/Bar/ update private_ip_poll="$(~/.config/eww/Bar/Scripts/private_ip.sh)"