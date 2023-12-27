{ config, pkgs, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-23.05";
  });
in
{
  imports = [ nixvim.nixosModules.nixvim ];

  programs.nixvim = {
    enable = true;
    options = {
        number = true;
        swapfile = false;
	backup = false;
    };
    plugins = {
      lightline.enable = true;
    };
    maps = {
      normal = {
        "zz" = {
          noremap = true;
          action = ":update<CR>";
        };
        "f" = {
          noremap = true;
          action = ":NERDTreeToggle<CR>";
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [ 
      lightline-ale
      nerdtree
      nvim-surround
    ];
    extraConfigVim = ''
      let g:NERDTreeDirArrowExpandable="+"
      let g:NERDTreeDirArrowCollapsible="-"
    '';
    extraConfigLua = ''

    '';
  };  
}
