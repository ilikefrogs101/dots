{ config, pkgs, ... }:
{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    layout = "us(colemak),au";
    xkbOptions = "grp:shifts_toggle";
  };

  console.useXkbConfig = true;
}
