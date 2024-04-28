{ pkgs, inputs, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "inconsolata:size=12.5";
        dpi-aware = "no";
        fields = "name,generic,comment,categories,filename,keywords";
        terminal = "$TERMINAL -e";

        prompt = " |> ";
        icon-theme = "ePapirus-Dark";
        icons-enabled = "yes";
        show-actions = "no";

        lines = "10";
        width = "65";
        horizontal-pad = "20";
        vertical-pad = "20";
        inner-pad = "10";
        line-height = "25";
        letter-spacing = "0";
        image-size-ratio = "0.25";

        layer = "top";
        exit-on-keyboard-focus-loss = "yes";
      };
      colors = {
        background = "32302ff2";
        text = "fbf1c7ff";
        match = "ff6000ff";
        selection = "1793d1ff";
        selection-text = "120024ff";
        border = "ebdbb2ff";
      };
      border = {
        width = "1";
        radius = "0";
      };
    };
  };
}
