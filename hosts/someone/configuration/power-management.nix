{ config, pkgs, ... }:
{
  powerManagement.enable = true;
  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTENT_DEFAULT = 1;
    };
  };

  #powerManagement.enable = true;
  #powerManagement.cpuFreqGovernor = "ondemand";
  #services.thermald.enable = true;
  #services.tlp.enable = true; 
  #services.auto-cpufreq.enable = true;
  #services.auto-cpufreq.settings = {
  #battery = {
  #governor = "powersave";
  #turbo = "never";
  #};
  #charger = {
  #governor = "performance";
  #turbo = "auto";
  #};
  #};
}
