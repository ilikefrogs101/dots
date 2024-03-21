{pkgs, inputs, ...}:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
        set fish_greeting

        export VISUAL=nvim
        export EDITOR=nvim
        export MOZ_ENABLE_WAYLAND=1
            
        direnv hook fish | source

        if test -e ~/.last_fish_open
            if [ (date '+%Y-%m-%d') != (cat ~/.last_fish_open) ]
                builtin history clear
                echo (date '+%Y-%m-%d') > ~/.last_fish_open
            end
        else
            builtin history clear
            echo (date '+%Y-%m-%d') > ~/.last_fish_open
        end
    '';

    shellAbbrs = {
      backup = "git --git-dir=$HOME/backup/ --work-tree=/";
      update_dns = "sudo hblock -O /home/ilikefrogs101/Documents/nixos/NetworkHosts -H none";
    };
  };
}
