{pkgs, inputs, ...}:
{
    programs.foot = {
        enable = true;
        settings = {
            main = {
                shell="fish";
                font="inconsolata:size=12";
            };
            mouse = {
                hide-when-typing="no";
                alternate-scroll-mode="yes";
            };
            colors = {
                alpha=0.98;
                foreground="ebdbb2";
                background="32302f";
                regular0="1d2021"; # black
                regular1="cc241d"; # red
                regular2="98971a"; # green
                regular3="d79921"; # yellow
                regular4="458588"; # blue
                regular5="b16286"; # purple
                regular6="689d6a"; # aqua
                regular7="ca480e"; # gray
                bright0="282828"; # bright black
                bright1="fb4934";  # bright red
                bright2="b8bb26";  # bright green
                bright3="fabd2f";  # bright yellow
                bright4="83a598";  # bright blue
                bright5="d3869b";  # bright purple
                bright6="8ec07c";  # bright aqua
                bright7="928374";  # bright gray 
            }; 
        };
    };
}
