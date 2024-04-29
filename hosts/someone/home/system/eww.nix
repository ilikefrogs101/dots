{ pkgs, inputs, ... }:
{
  programs.eww = {
    enable = true;
    configDir = ../../linked-dots/eww;
  };
}
