{ config, pkgs, inputs, ...}:
{
  home.file = {
    ".config/ranger/rifle.conf" = { source = ../../linked-dots/ranger/rifle.conf; target = ".config/ranger/rifle.conf"; };
  };
}
