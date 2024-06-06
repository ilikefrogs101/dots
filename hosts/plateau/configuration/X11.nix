{ config, pkgs, ... }:
{
  #environment.sessionVariables.XDG_DATA_DIRS = with pkgs; "$XDG_DATA_DIRS:${gtk3}/share/gsettings-schemas/gtk+3-${gtk3.version}:${gsettings-desktop-schemas}/share/gsettings-schemas/gsettings-desktop-schemas-${gsettings-desktop-schemas.version}";

  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  programs.dconf.enable = true;

  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    xkb = {
      layout = "us(colemak_dh),au";
      options = "grp:shifts_toggle";
    };
  };

  console.useXkbConfig = true;
}
