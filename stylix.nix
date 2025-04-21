{ inputs, pkgs-unstable, ...}: {

stylix = {
    enable = true;
    homeManagerIntegration.autoImport = true;
    base16Scheme = "${pkgs-unstable.base16-schemes}/share/themes/rose-pine.yaml";
    image = ./wallhaven-7286p3.png;
    polarity = "dark";
    autoEnable = false;

    fonts = {
      # monospace = {
      # };
      sansSerif = {
        package = pkgs-unstable.atkinson-hyperlegible-next;
        name = "Atkinson Hyperlegible Next";
      };
      # serif = {
      # };
    };

    # targets = {
    #   hyprland.enable= false;
    # };
    
  };
}
