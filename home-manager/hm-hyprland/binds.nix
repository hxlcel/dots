{ inputs, ...}:
let
  mod = "SUPER";
in
{
  wayland.windowManager.hyprland.keyBinds = {
    # Quick launch programs
    bind."${mod}, T" = "exec, kitty";
    # bindr."${mod}, ${mod}_L" = "exec, fuzzel";
    bindr."${mod}, ${mod}_L" = "exec, rofi -show drun -show-icons";
    # bindr."${mod}, ${mod}_L" = "exec, sherlock";

    # Lock desktop environment
    # bind."${mod}, L" = "exec, ";

    # Kill active window
    bind."${mod}, Q" = "killactive,";

    bind."${mod}_SHIFT, F" = "fullscreen, 0";
    bind."${mod}, F" = "togglefloating,";

    # Window navigation
    bind."${mod}, H" = "movefocus, l";
    bind."${mod}, J" = "movefocus, d";
    bind."${mod}, K" = "movefocus, u";
    bind."${mod}, L" = "movefocus, r";
    bind."ALT, TAB" = "cyclenext";

    # Moving windows
    bind."${mod}_SHIFT, H" = "movewindow, l";
    bind."${mod}_SHIFT, J" = "movewindow, d";
    bind."${mod}_SHIFT, K" = "movewindow, u";
    bind."${mod}_SHIFT, L" = "movewindow, r";
    bindm."${mod}, mouse:272" = "movewindow";
    bindm."${mod}, mouse:273" = "resizewindow";

    # Workspaces
    bind."${mod}, 1" = "workspace, 1";
    bind."${mod}, 2" = "workspace, 2";
    bind."${mod}, 3" = "workspace, 3";
    bind."${mod}, 4" = "workspace, 4";
    bind."${mod}, 5" = "workspace, 5";
    bind."${mod}, 6" = "workspace, 6";
    bind."${mod}, 7" = "workspace, 7";
    bind."${mod}, 8" = "workspace, 8";
    bind."${mod}, 9" = "workspace, 9";
    bind."${mod}, 0" = "workspace, 0";
    bind."${mod}_SHIFT, 1" = "movetoworkspace, 1";
    bind."${mod}_SHIFT, 2" = "movetoworkspace, 2";
    bind."${mod}_SHIFT, 3" = "movetoworkspace, 3";
    bind."${mod}_SHIFT, 4" = "movetoworkspace, 4";
    bind."${mod}_SHIFT, 5" = "movetoworkspace, 5";
    bind."${mod}_SHIFT, 6" = "movetoworkspace, 6";
    bind."${mod}_SHIFT, 7" = "movetoworkspace, 7";
    bind."${mod}_SHIFT, 8" = "movetoworkspace, 8";
    bind."${mod}_SHIFT, 9" = "movetoworkspace, 9";
    bind."${mod}_SHIFT, 0" = "movetoworkspace, 0";

    # Misc
    bind."${mod}_ALT, N" = "exec, dunstctl close-all";


    # Hyprshot
    bind."${mod}_SHIFT, s" = "exec, hyprshot -m region --clipboard-only";
  };
}
