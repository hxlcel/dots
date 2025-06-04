{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  imports = [
    ./hxlcel-desktop.nix
    ./nvidia.nix
    ../default/packages.nix
    ../default/users.nix
    ./host-packages.nix
    ./services.nix
    ./stylix.nix
    ../default/kanata.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Disable stylix hyprland interaction (stylix dont like hyprnix)
  disabledModules = ["${inputs.stylix}/modules/hyprland/nixos.nix"];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.zsh.enable = true;

  networking.hostName = "hxlcel-desktop"; # Define your hostname.
  networking.networkmanager.enable = true;

  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  # users.users.hazel = {
  #   isNormalUser = true;
  #   home = "/home/hazel/";
  #   createHome = true;
  #   description = "Hazel";
  #   extraGroups = [ "networkmanager" "wheel" ];
  #   shell = pkgs.zsh;
  # };

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

  ###---- ENVIRONMENT ----###
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  ### Hyprland
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.xserver.desktopManager.gnome.enable = true;

  ###---- HARDWARE ----###
  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {General = {Experimental = true;};};
  };

  hardware.keyboard.qmk.enable = true;

  services.udev.packages = [
    pkgs-unstable.qmk-udev-rules
    pkgs-unstable.vial
  ];

  environment.variables.EDITOR = "nvim";

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Literally just leave it alone, don't fuck with it.
}
