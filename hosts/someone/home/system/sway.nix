{ config, pkgs, inputs, ... }:
{
  programs.sway.enable = true;
  programs.sway.wrapperFeatures.gtk = true;
}
