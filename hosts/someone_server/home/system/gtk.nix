{ pkgs, inputs, ... }:
let
  posy-cursors = pkgs.callPackage ../../../../packages/posy-cursors/default.nix { };
in
{
  home.file.".icons/default".source = "${posy-cursors}/share/icons/Posy_Cursor_Black";
  home.file.".local/share/icons/default".source = "${posy-cursors}/share/icons/Posy_Cursor_Black";
  gtk = {
    enable = true;
    font = {
      package = pkgs.inconsolata;
      name = "inconsolata";
      size = 12;
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "ePapirus-Dark";
    };
    cursorTheme = {
      package = posy-cursors;
      name = "Posy's Cursor Black";
    };
    gtk2.extraConfig = "gtk-application-prefer-dark-theme = true";
    gtk3.extraConfig = { gtk-application-prefer-dark-theme = true; };
    gtk4.extraConfig = { gtk-application-prefer-dark-theme = true; };
  };

}
