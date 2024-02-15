{ pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./system/sway.nix
    ./system/nvim.nix
  ];

  # Manually link non-nix dots
  systemd.tmpfiles.rules = [
    "L /home/ilikefrogs101/.config/ranger/ - - - - /home/ilikefrogs101/Documents/nixos/hosts/someone_server/linked-dots/ranger/"
    "L /home/ilikefrogs101/.config/sway/ - - - - /home/ilikefrogs101/Documents/nixos/hosts/someone_server/linked-dots/sway/"
    "L /home/ilikefrogs101/.config/swaync/ - - - - /home/ilikefrogs101/Documents/nixos/hosts/someone_server/linked-dots/swaync/"
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
      ./system/waybar.nix

      ./apps/librewolf.nix
    ];

    home.username = "ilikefrogs101";
    home.homeDirectory = "/home/ilikefrogs101";
    home.stateVersion = "23.11"; 

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
    ];
  };
}
