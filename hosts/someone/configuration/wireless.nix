{ config, pkgs, ... }:
{
  # SSH
  services.openssh = {
    enable = true;
    ports = [ 58 ];
  };

  # VPN
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  # Enable networking
  networking.hostName = "someone"; # Define your hostname.
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

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
}
