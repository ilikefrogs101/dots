{ config, pkgs, inputs, ...}:
{
  home.file = {
    ".config/swaync/config.json" = { source = ../../linked-dots/swaync/config.json; target = ".config/swaync/config.json"; };
    ".config/swaync/style.css" = { source = ../../linked-dots/swaync/style.css; target = ".config/swaync/style.css"; };
  };
}
