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
  networking.hostName = "valley"; # Define your hostname.
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
  system.userActivationScripts.rfkillUnblockAll = {
    text = ''
      rfkill unblock all
    '';
    deps = [ ];
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}
