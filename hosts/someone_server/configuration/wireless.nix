{ config, pkgs, ... }:
{
  # SSH
  services.openssh = {
    enable = true;
    ports = [ 58 ];
  };

  # Enable networking
  networking.hostName = "someone_server"; # Define your hostname.
  networking.extraHosts = ''
    ${builtins.readFile ../../../NetworkHosts};
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
