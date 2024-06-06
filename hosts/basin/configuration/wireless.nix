{ config, pkgs, ... }:
{
  # SSH
  services.openssh = {
    enable = true;
    ports = [ 58 ];
  };

  # Enable networking
  networking.hostName = "basin"; # Define your hostname.
  networking.extraHosts = ''
    ${builtins.readFile ../../../network-hosts};
  '';

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;

  # Wifi
  networking.wireless = {
    iwd = {
      enable = true;
      settings = {
        General = {
          EnableNetworkConfiguration = true;
        };
        Settings = {
          AutoConnect = true;
        };
      };
    };
    userControlled.enable = true;
  };
}
