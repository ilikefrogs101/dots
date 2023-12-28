set fish_greeting

if status is-interactive
    export VISUAL=nvim
    export EDITOR=nvim
    export MOZ_ENABLE_WAYLAND=1
    
    if test -e ~/.last_fish_open
        if [ (date '+%Y-%m-%d') != (cat ~/.last_fish_open) ]
            builtin history clear
            echo (date '+%Y-%m-%d') > ~/.last_fish_open
        end
    else
        builtin history clear
        echo (date '+%Y-%m-%d') > ~/.last_fish_open
    end
end
