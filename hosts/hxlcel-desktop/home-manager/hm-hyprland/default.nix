{ self, config, pkgs-unstable, lib, pkgs, ...}:
{
  imports = [
    ./animations.nix
    ./binds.nix
    ./config.nix
    ./desktop-env-pkgs.nix
    ./window-rules.nix
  ];

  programs.waybar.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    reloadConfig = true;
    systemdIntegration = true;
    recommendedEnvironment = true;

    xwayland.enable = true;

    config.exec_once = [
      "${lib.getExe pkgs.lxqt.lxqt-policykit}"
      "${lib.getExe pkgs.xorg.xhost} +local:"
      "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprpolkitagent"
      "killall -q swww; sleep .5 && swww init" # Vertical monitor support being worked on currently.
      "killall -q mega-cmd; sleep 0.5 && mega-cmd"
      # "killall -q swaybg; sleep 0.5 && swaybg -i ~/Pictures/Wallpapers/wallhaven-wyk796.jpg -m fill"
      "killall -q waybar;sleep .5 && waybar"
      # "killall -q swaync;sleep .5 && swaync"
      "killall -q dunst;sleep .5 && dunst"
      "nm-applet --indicator"
      # "sleep 1.5 && swww img ~/Pictures/Wallpapers/nc-night.gif"
      # "pypr &"
    ];

    config.input = {
      kb_options = [
        "caps:super"
      ];
      sensitivity = -0.25;
      accel_profile = "flat";
    };

    config.monitor = [
      ", preferred, auto, 1"
      "HDMI-A-1, 1920x1080, 0x0, 1"
      "DP-1, preferred, 1920x0, 1, transform, 3"
    ];

    # TODO: not sure if this works, goal is to set certain workspaces to certain monitors. Env wide workspaces instead of per monitor?
    workspaceRules = {
      "1".monitor = "DP-2";
    };

  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
