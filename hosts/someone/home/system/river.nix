{ config, pkgs, inputs, ... }:
{
  programs.river.enable = true;

  programs.xwayland.enable = true;

  home-manager.users.ilikefrogs101.home.file = {
    ".config/river/" = { source = ../../linked-dots/river; target = ".config/river/"; };
  };
}
