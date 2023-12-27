# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:
let
  godot4-mono = pkgs.callPackage /home/ilikefrogs101/Documents/Development/Nix-Packages/Godot-4-Mono/default.nix {};
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./nvim.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Bluetooth
  hardware.bluetooth.enable = false;
  hardware.bluetooth.powerOnBoot = false;
  services.blueman.enable = false;

  # Power management
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

  # OpenGL
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [intel-media-driver];

  networking.hostName = "someone"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.extraHosts = ''
    ${builtins.readFile ./hosts};
  '';

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Configure X11
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    layout = "us(colemak),au";
    xkbOptions = "grp:shifts_toggle";
  };

  console.useXkbConfig = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  programs.sway.enable = true;
  programs.sway.wrapperFeatures.gtk = true;

  services.usbmuxd.enable = true;
  sound.enable = true;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ilikefrogs101 = {
    isNormalUser = true;
    description = "ilikefrogs101";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  # Set package settings configuration
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import <nixos-unstable> {
        config = config.nixpkgs.config;
      };
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Personal
    librewolf
    webcord
    godot4-mono
    vscodium-fhs
    blender
    prismlauncher

    # Essential
    firefox
    libreoffice
    sticky
    foliate
    gnome-feeds
    hblock
    gpg-tui
    imv
    ranger
    vlc
    atool
    zip
    unzip
    pulsemixer
    glib
    gh
    git
    dotnet-sdk
    mono
    dotnet-runtime
    papirus-icon-theme
    xdg-user-dirs
    autotiling
    brightnessctl
    mako
    libnotify
    fuzzel
    waybar
    gnupg
    grim
    slurp
    wlsunset
    wl-clipboard
    swaylock
    swayidle
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    package = pkgs.steam.override {
      extraLibraries = p: [
        p.curl
        p.dosbox
      ];
    };
  };

  programs.bash.shellAliases = {
    config = "git --git-dir=$HOME/config/ --work-tree=/";
    backup = "git --git-dir=$HOME/backup/ --work-tree=/";
  };

  services.gnome.gnome-keyring.enable = true;
  programs.gnupg.agent.enable = true;

  fonts.packages = with pkgs; [
    comfortaa
    inconsolata
    fira-code
    fira-mono
    font-awesome
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
