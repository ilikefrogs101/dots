{ config, pkgs, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-23.11";
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

    keymaps = [
      {
        key = "zz";
        action = ":update<CR>";
      }
      {
        key = "f";
        action = ":NERDTreeToggle<CR>";
      }
    ];

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
