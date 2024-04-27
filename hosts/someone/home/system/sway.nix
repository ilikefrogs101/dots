{ config, pkgs, inputs, ...}:
{
  programs.sway.enable = false;
  programs.sway.wrapperFeatures.gtk = true;

  programs.xwayland.enable = true;

  home-manager.users.ilikefrogs101.home.file = {
    ".config/sway/config" = { source = ../../linked-dots/sway/config; target = ".config/sway/config"; };
  };
}
