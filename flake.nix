{
  description = "system flake";
  inputs = {
    nixpkgs-stable = { url = "github:nixos/nixpkgs/nixos-24.05"; };
    nixpkgs-unstable = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    nixos-hardware = { url = "github:NixOS/nixos-hardware/master"; };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };

  outputs = inputs:
    let
      system = "x86_64-linux";

      pkgs = inputs.nixpkgs-stable.legacyPackages.${system};
      unstable-pkgs = inputs.nixpkgs-unstable.legacyPackages.${system};

      lib = inputs.nixpkgs-stable.lib;
    in
    {
      formatter.x86_64-linux = pkgs.nixpkgs-fmt;

      nixosConfigurations = {
        plateau = lib.nixosSystem {
          modules = [
	    inputs.nixos-hardware.nixosModules.common-pc-laptop

            ./hosts/plateau/configuration/configuration.nix
            ./hosts/plateau/home/home.nix
          ];
          specialArgs = { inherit inputs; };
        };
        valley = lib.nixosSystem {
          modules = [
	    inputs.nixos-hardware.nixosModules.common-pc-laptop

            ./hosts/valley/configuration/configuration.nix
            ./hosts/valley/home/home.nix
          ];
          specialArgs = { inherit inputs; };
        };
        basin = lib.nixosSystem {
          modules = [
            ./hosts/basin/configuration/configuration.nix
            ./hosts/basin/home/home.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
