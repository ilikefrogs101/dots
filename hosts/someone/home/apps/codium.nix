{pkgs, inputs, ...}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
        ms-dotnettools.csharp
        jdinhlife.gruvbox
        jnoortheen.nix-ide
    ];
    userSettings = {
        "workbench.colorTheme" = "Gruvbox Dark Hard";
    };
  };
}
