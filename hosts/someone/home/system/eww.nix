{pkgs, inputs, ...}:
{
  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = ../../linked-dots/eww;
  };
}
