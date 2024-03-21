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
	"terminal.integrated.defaultProfile.linux" = "fish";
        "zig.path" = "${pkgs.zig}/bin/zig";
	"zig.zls.path" = "${pkgs.zls}/bin/zls";
        "zig.initialSetupDone" = true;
    };
  };
}
