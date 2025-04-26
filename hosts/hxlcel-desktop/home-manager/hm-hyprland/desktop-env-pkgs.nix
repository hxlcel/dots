{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (
    with pkgs; [


    ])
    ++
    (with pkgs-unstable; [
      xorg.xhost
      swww
      swaybg
      grim
      slurp
      swappy
      hyprshot
      # hyprlock
      ydotool
      hyprpolkitagent
      hyprland-qtutils
      swaynotificationcenter
      xdg-utils
      cpu-x
      wev
      qdirstat
      gparted
      lxqt.pavucontrol-qt
      system-config-printer
      iwd
      iwgtk
      nwg-displays
      # hyprcursor # Enabled in ../wayland/gui-theme.nix

    ]);

}
