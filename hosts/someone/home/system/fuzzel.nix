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
      colors = pkgs.lib.mkDefault {
        background = "282828ff";
        text = "ebdbb2ff";
        match = "928374ff";
        selection = "a89984ff";
        selection-text = "ebdbb2ff";
        selection-match = "928374ff";
        border = "ebdbb2ff";
      };
      border = {
        width = "1";
        radius = "0";
      };
    };
  };

  specialisation.light.configuration.programs.fuzzel.settings.colors = {
    background = "fbf1c7ff";
    text = "3c3836ff";
    match = "928374ff";
    selection = "7c6f64ff";
    selection-text = "3c3836ff";
    selection-match = "928374ff";
    border = "3c3836ff";
  };
}
