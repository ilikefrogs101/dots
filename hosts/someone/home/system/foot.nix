{ pkgs, inputs, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "fish";
        font = "inconsolata:size=12";
      };
      mouse = {
        hide-when-typing = "no";
        alternate-scroll-mode = "yes";
      };
      colors = pkgs.lib.mkDefault {
        alpha = 0.98;
        foreground = "ebdbb2";
        background = "282828";
        regular0 = "a89984"; # gray
        regular1 = "cc241d"; # red
        regular2 = "98971a"; # green
        regular3 = "d79921"; # yellow
        regular4 = "458588"; # blue
        regular5 = "b16286"; # purple
        regular6 = "689d6a"; # aqua
        regular7 = "d65d0e"; # orange
        bright0 = "928374"; # bright gray
        bright1 = "fb4934"; # bright red
        bright2 = "b8bb26"; # bright green
        bright3 = "fabd2f"; # bright yellow
        bright4 = "83a598"; # bright blue
        bright5 = "d3869b"; # bright purple
        bright6 = "8ec07c"; # bright aqua
        bright7 = "fe8019"; # bright orange 
      };
    };
  };

  specialisation.light.configuration.programs.foot.settings.colors = {
    alpha = 0.98;
    foreground = "3c3836";
    background = "fbf1c7";
    regular0 = "928374"; # gray
    regular1 = "cc241d"; # red
    regular2 = "98971a"; # green
    regular3 = "d79921"; # yellow
    regular4 = "458588"; # blue
    regular5 = "b16286"; # purple
    regular6 = "689d6a"; # aqua
    regular7 = "d65d0e"; # orange
    bright0 = "7c6f64"; # bright gray
    bright1 = "9d0006"; # bright red
    bright2 = "79740e"; # bright green
    bright3 = "b57614"; # bright yellow
    bright4 = "076678"; # bright blue
    bright5 = "8f3f71"; # bright purple
    bright6 = "427b58"; # bright aqua
    bright7 = "af3a03"; # bright orange 
  };
}
