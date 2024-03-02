{pkgs, inputs, ...}:
{
  	direnv = {
      	enable = true;
      	enableFishIntegration = true;
      	nix-direnv.enable = true;
	};
}
