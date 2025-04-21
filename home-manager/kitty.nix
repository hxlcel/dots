{ config, lib, pkgs, ... }:
{

  programs.kitty = {
    enable = true;
    font.name = "jetbrains-mono";
    font.size = 12;
    themeFile = "rose-pine-moon";
    settings = {
      shell = "zsh";
      window_padding_width = 2;
      hide_window_decorations = true;
      background = "#000000";
      background_opacity = 0.5;
      background_blur = 1;
    };
  };

}
