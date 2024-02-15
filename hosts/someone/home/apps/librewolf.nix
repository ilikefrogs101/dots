{pkgs, inputs, ...}:
{
  programs.librewolf = {
    enable = true;
    package = inputs.unstable.legacyPackages.x86_64-linux.librewolf;
    settings = {
      "browser.download.useDownloadDir" = false; 
      "places.history.enabled" = false;
      "privacy.donottrackheader.enabled" = true;
      "privacy.globalprivacycontrol.enabled" = true;
      "signon.management.page.breach-alerts.enabled" = false;
      "network.http.referer.XOriginPolicy" = 2;
      "privacy.resistFingerprinting.letterboxing" = true;
    };
  };
}
