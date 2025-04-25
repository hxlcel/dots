{ config, pkgs, pkgs-unstable, inputs, ... }:

{
  imports = [ 
    ./desktop.nix
    ./nvidia.nix
    ./sys-pkgs.nix
    ./services.nix
    ./sys-hyprland.nix
    ./stylix.nix
  ];
  # Disable stylix hyprland interaction (stylix dont like hyprnix)
  disabledModules = [ "${inputs.stylix}/modules/hyprland/nixos.nix"];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.zsh.enable = true;
  users.users.hazel.shell = pkgs.zsh;

  # programs.fish.enable = true;
  # users.users.hazel.shell = pkgs.fish;

  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Australia/Brisbane";

  i18n.defaultLocale = "en_AU.UTF-8";

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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.hazel = {
    isNormalUser = true;
    home = "/home/hazel/";
    createHome = true;
    description = "Hazel";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = { General = { Experimental = true; }; };
  };

  # stylix = {
  #   enable = true;
  #   homeManagerIntegration.autoImport = true;
  #   base16Scheme = "${pkgs-unstable.base16-schemes}/share/themes/rose-pine.yaml";
  #   image = ./wallhaven-7286p3.png;
  #   polarity = "dark";
  #   autoEnable = false;
  #   # fonts = {
  #   #   monospace = {
  #   #   };
  #   #   sansSerif = {
  #   #   };
  #   #   serif = {
  #   #   };
  #   # };
  # };

  environment.variables.EDITOR = "nvim";

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Literally just leave it alone, don't fuck with it. 

}
