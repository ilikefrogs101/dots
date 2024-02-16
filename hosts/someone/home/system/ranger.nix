{ config, pkgs, inputs, ...}:
{
  home.file = {
    ".config/ranger/rifle.conf" = { source = config.lib.file.mkOutOfStoreSymlink ../../linked-dots/ranger/rifle.conf; target = ".config/ranger/rifle.conf"; };
  };
}
