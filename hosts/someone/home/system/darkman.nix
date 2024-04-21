{pkgs, inputs, ...}:
{
  programs.darkman = {
    enable = true;
    darkModeScripts = {
      hm-switch = ''"$(home-manager generations | head -1 | rg -o '/[^ ]*')"/specialisation/dark/activate'';
    };
    lightModeScripts = {
      hm-switch = ''"$(home-manager generations | head -1 | rg -o '/[^ ]*')"/specialisation/light/activate'';
    };
  };
}
