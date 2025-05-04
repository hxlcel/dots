{lib, hyprnix, ... }:
{
  wayland.windowManager.hyprland = {

    config.general = {
      border_size = 2;
      gaps_inside = 5;
      gaps_outside = 5;
    };

    config.decoration = {
      rounding = 10;
      shadow = {
        range = 8;
        render_power = 2;
      };
      blur = {
        enabled = true;
        size = 5;
        passes = 3;
        ignore_opacity = true;
        new_optimizations = true;
      };
    };
    
    config.misc = let FULLSCREEN_ONLY = 2;
      in {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        variable_framerate = true;
        variable_refresh = FULLSCREEN_ONLY;
        disable_autoreload = true;
    };
  };
}
