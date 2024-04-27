{pkgs, inputs, ...}:
{
  services.darkman = {
    enable = false;
    settings = {
      lat = -35.0;
      lng = 149.0;
    };
    darkModeScripts = pkgs.lib.mkDefault {
      hm-switch = ''"$(home-manager generations | head -1 | rg -o '/[^ ]*')"/activate'';
    };
    lightModeScripts = pkgs.lib.mkDefault {
      hm-switch = ''"$(home-manager generations | head -1 | rg -o '/[^ ]*')"/specialisation/light/activate'';
    };
  };

  specialisation.light.configuration.services.darkman = {
    darkModeScripts = {
      hm-switch = ''"$(home-manager generations | head -2 | tail -1 | rg -o '/[^ ]*')"/activate'';
    };
    lightModeScripts = {
      hm-switch = ''"$(home-manager generations | head -1 | rg -o '/[^ ]*')"/activate'';
    };
  };
}
