{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.nixosModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    options = {
      number = true;
      syntax = "on";
      swapfile = false;
	    backup = false;
	    termguicolors = true;
	    clipboard = "unnamedplus";
    };

    plugins = { 
    };

    keymaps = [
      {
        key = "zz";
        action = ":update<CR>";
	      options.noremap = true;
      }
      {
        key = "f";
        action = ":NERDTreeToggle<CR>";
      }
      {
        key = "y";
	action = ''"+y'';
      }
      {
        key = "p";
	action = ''"+P'';
      }
    ];

    clipboard.providers.wl-copy.enable = true;

    #colorscheme = "gruvbox";
    colorschemes.gruvbox.enable = true;
    colorschemes.gruvbox.contrastDark = "soft";

    plugins.lightline.enable = true;
    plugins.vimtex.enable = true;
    plugins.vimtex.settings.view_method = "default";

    extraPlugins = with pkgs.vimPlugins; [ 
      lightline-ale
      vimtex
      nvim-surround
      gruvbox
    ];
    extraConfigVim = ''
    '';
    extraConfigLua = ''
    '';
  };  
}
