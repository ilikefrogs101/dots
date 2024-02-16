{ config, pkgs, inputs, ...}:
{
  home.file = {
    ".config/swaync/config.json" = { source = config.lib.file.mkOutOfStoreSymlink ../../linked-dots/swaync/config.json; target = ".config/swaync/config.json"; };
    ".config/swaync/style.css" = { source = config.lib.file.mkOutOfStoreSymlink ../../linked-dots/swaync/config.json; target = ".config/swaync/style.css"; };
  };
}
