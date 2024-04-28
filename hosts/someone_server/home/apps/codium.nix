{ pkgs, inputs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      ms-dotnettools.csharp
      jdinhlife.gruvbox
      jnoortheen.nix-ide
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-zig";
        publisher = "ziglang";
        version = "0.5.4";
        sha256 = "sha256-kczkVm847COmpNtUJI5lsZIuM7qAU6UgE8SCj8ZhIaA=";
      }
    ];
    userSettings = {
      "workbench.colorTheme" = "Gruvbox Dark Hard";
      "terminal.integrated.defaultProfile.linux" = "fish";
      "zig.path" = "${pkgs.zig}/bin/zig";
      "zig.zls.path" = "${pkgs.zls}/bin/zls";
      "zig.initialSetupDone" = true;
    };
  };
}
