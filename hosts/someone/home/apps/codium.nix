{ pkgs, inputs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      ms-dotnettools.csharp
      jdinhlife.gruvbox
      jnoortheen.nix-ide
      james-yu.latex-workshop
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-zig";
        publisher = "ziglang";
        version = "0.5.7";
        sha256 = "sha256-YLXdiXJriC7E05bRHLGNxNWYJq17tOrjaLlTHoMDa4Y=";
      }
      {
        name = "Yuck";
        publisher = "eww-yuck";
        version = "0.0.3";
        sha256 = "sha256-DITgLedaO0Ifrttu+ZXkiaVA7Ua5RXc4jXQHPYLqrcM=";
      }
      {
        name = "godot-tools";
        publisher = "Geequlim";
        version = "2.0.0";
        sha256 = "sha256-6lSpx6GooZm6SfUOjooP8mHchu8w38an8Bc2tjYaVfw=";
      }
    ];
    userSettings = {
      "workbench.colorTheme" = pkgs.lib.mkDefault "Gruvbox Dark Medium";
      "terminal.integrated.defaultProfile.linux" = "fish";
      "zig.path" = "${pkgs.zig}/bin/zig";
      "zig.zls.path" = "${pkgs.zls}/bin/zls";
      "zig.initialSetupDone" = true;
    };
  };
}
