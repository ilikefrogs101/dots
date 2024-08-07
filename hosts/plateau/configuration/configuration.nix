{ config, lib, pkgs, inputs, ... }:
let
  godot4-dotnet = pkgs.callPackage ../../../packages-modules/packages/godot4-dotnet/default.nix { };
  wordy = pkgs.callPackage ../../../packages-modules/packages/wordy/default.nix { };
  gentium-kaktovik = pkgs.callPackage ../../../packages-modules/packages/gentium-kaktovik/default.nix { };
in
{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd

    ./hardware-configuration.nix

    ./keyrings.nix
    ./power-management.nix
    ./wireless.nix
    ./X11.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Touchscreen and Stylus
  hardware.opentabletdriver.enable = true;

  # OpenGL
  hardware.opengl.enable = true;

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
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
    packages = with pkgs; [ ];
  };

  # Set package settings configuration
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Packages 
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  environment.systemPackages = with pkgs; [
    # Personal
    librewolf
    signal-desktop
    mullvad-browser
    webcord
    #godot4-dotnet
    wordy
    blender
    prismlauncher
    zig
    zls
    asciiquarium-transparent

    # Essential
    firefox
    onlyoffice-bin
    libreoffice
    sticky
    foliate
    gnome-feeds
    activate-linux
    libqalculate
    numbat
    hblock
    gpg-tui
    swayimg
    ranger
    vlc
    sox
    atool
    zip
    ripgrep
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
    swaynotificationcenter
    libnotify
    waybar
    gnupg
    wirelesstools
    grim
    slurp
    wlsunset
    wl-clipboard
    swaylock
    swayidle
    swaybg
    waypipe
  ];

  fonts.packages = with pkgs; [
    comfortaa
    inconsolata
    fira-code
    fira-mono
    font-awesome
    gentium-kaktovik

    corefonts
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
