{
  description = "system flake";
  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-23.11"; };
    unstable = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-previous = { url = "github:nixos/nixpkgs/e49c28b3baa3a93bdadb8966dd128f9985ea0a09"; };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    nixosConfigurations = {
      someone = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/someone/configuration/configuration.nix
          ./hosts/someone/home/home.nix
        ];
        specialArgs = { inherit inputs; };
      };
      someone_server = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/someone_server/configuration/configuration.nix
          ./hosts/someone_server/home/home.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
