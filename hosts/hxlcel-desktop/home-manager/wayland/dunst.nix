{ config, lib, pkgs-unstable, ... }:
{
home.packages = [ pkgs-unstable.libnotify ];

services.dunst = {
    enable = true;

    waylandDisplay = "wayland-0";

    iconTheme = {
      name = "rose-pine-gtk";
      package = pkgs-unstable.rose-pine-gtk-theme;
      size= "32x32";
    };
    settings = {
      global = {
        # position
        layer = "overlay";
        follow = "mouse";
        origin = "top-right";
        offset = "6x32";

        # limits
        notification-limit = 7;
        indicate_hidden = true;
        idle_threshold = "1m";
        sticky_history = 20;
        
        # appearance
        frame_width = 2;
        corner_radius = 5;
        width = "(250, 350)";
        height = 150;
        gap_size = 6;

        # progress
        progress_bar_height = 20;
        progress_bar_min_width = 250;
        progress_bar_max_width = 350;
        progress_bar_frame_width = 2;

        # text
        font = "Atkinson Hyperlegible Next Regular 9";
        markup = "full";
        line_height = 4;
        padding = 12;
        format = "<b>%s</b>\\n%b\\n<small><i>%a</i></small>";

        # icon
        vertical_alignment = "top";

        # actions
        mouse_left_click = "do_action";
        mouse_right_click = "close_current";
        mouse_middle_click = "context";
        dmenu = "${lib.getExe config.programs.rofi.package} -dmenu -p dunst";
      };
    };
  };
}
