{ config, pkgs, ... }:
{
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;
  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;
  services.tlp.enable = true;
}
