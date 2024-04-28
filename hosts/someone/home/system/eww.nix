{ pkgs, inputs, ... }:
{
  programs.eww = {
    enable = true;
    package = inputs.unstable.legacyPackages.x86_64-linux.eww;
    configDir = ../../linked-dots/eww;
  };
}
