{ pkgs, inputs, ... }:
{
  programs.nix-index =
  {
    enable = true;
    enableFishIntegration = true;
  };
}
