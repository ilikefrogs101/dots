{ config, pkgs, inputs, ...}:
{
  programs.sway.enable = true;
  programs.sway.wrapperFeatures.gtk = true;

  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.ilikefrogs101 = 
  {
    home.file = {
      ".config/sway/config" = { source = config.lib.file.mkOutOfStoreSymlink ../../linked-dots/sway/config; };
    };
  };
}
