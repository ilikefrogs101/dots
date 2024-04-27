{ config, pkgs, inputs, ...}:
{
  programs.river.enable = true;

  programs.xwayland.enable = true;
}