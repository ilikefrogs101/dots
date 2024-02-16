{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./system/sway.nix
    ./system/nvim.nix
    
    ./apps/steam.nix
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = { inherit inputs; };

  home-manager.users.ilikefrogs101 =
  {
    imports = [
      ./system/bottom.nix
      ./system/fish.nix
      ./system/foot.nix
      ./system/fuzzel.nix
      ./system/gtk.nix
      ./system/mimeapps.nix
      ./system/ranger.nix
      ./system/swaync.nix
      ./system/waybar.nix

      ./apps/librewolf.nix
    ];

    programs.home-manager.enable = true;

    home.username = "ilikefrogs101";
    home.homeDirectory = "/home/ilikefrogs101";
    home.stateVersion = "23.11"; 

    home.packages = with pkgs; [
    ];
  };
}
