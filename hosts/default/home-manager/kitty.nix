{ ... }:
{

  programs.kitty = {
    enable = true;
    # font.name = "jetbrains-mono";
    font.name = "FiraCodeNFM-Reg";
    # font.name = "MonoLisa";
    font.size = 10;
    # themeFile = "rose-pine-moon";
    themeFile = "rose-pine";
    settings = {
      shell = "zsh";
      window_padding_width = 2;
      hide_window_decorations = true;
      enable_audio_bell = false;

      # background = "#000000";
      # background_opacity = 0.75;
      # background_blur = 1;
      #
      # underline_position = 0;
      # underline_thickness = "200%";
    };
  };

}
