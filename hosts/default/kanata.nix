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

  # TODO: not working for surface keyboard...
  # NOTES: Adds a little delay feels really uncomfortable, typos
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        # Replace the paths below with the appropriate device paths for your setup.
        # Use `ls /dev/input/by-path/` to find your keyboard devices.
        devices = [];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          ;; to allow kanata to process unmapped keys
          (defsrc
          ;;  caps a s d f j k l ;
          caps
          )

          (defvar
            tap-time 150
            hold-time 200
          )

          (defalias
          ;; most common homerow mod order: super, alt, shift, control
          ;;  a (multi f24 (tap-hold $tap-time $hold-time a lmet))
          ;;  s (multi f24 (tap-hold $tap-time $hold-time s lalt))
          ;;  d (multi f24 (tap-hold $tap-time $hold-time d lsft))
          ;;  f (multi f24 (tap-hold $tap-time $hold-time f lctl))
          ;;  j (multi f24 (tap-hold $tap-time $hold-time j rctl))
          ;;  k (multi f24 (tap-hold $tap-time $hold-time k rsft))
          ;;  l (multi f24 (tap-hold $tap-time $hold-time l ralt))
          ;;  ; (multi f24 (tap-hold $tap-time $hold-time ; rmet))
          )

          (deflayer base
          ;;  esc @a @s @d @f @j @k @l @;
          esc
          )
        '';
      };
    };
  };
}
