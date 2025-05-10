{
  config,
  lib,
  pkgs,
  ...
}: {
  # Enable the uinput module
  boot.kernelModules = ["uinput"];

  # Enable uinput
  hardware.uinput.enable = true;

  # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = {};

  # Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        # Replace the paths below with the appropriate device paths for your setup.
        # Use `ls /dev/input/by-path/` to find your keyboard devices.
        devices = [];
        config = ''          # Configure with ~/.dotfiles/non-nix/kanata.kbd
        '';
      };
    };
  };
}
