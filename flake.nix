{
  description = "system flake";
  inputs = {
    nixpkgs-stable = { url = "github:nixos/nixpkgs/nixos-23.11"; };
    nixpkgs-unstable = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-23.11";
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
        someone = lib.nixosSystem {
          modules = [
            ./hosts/someone/configuration/configuration.nix
            ./hosts/someone/home/home.nix
          ];
          specialArgs = { inherit inputs; };
        };
        someone_server = lib.nixosSystem {
          modules = [
            ./hosts/someone_server/configuration/configuration.nix
            ./hosts/someone_server/home/home.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
