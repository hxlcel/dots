{ self, config, pkgs-unstable, pkgs, ... }: {
  imports = [
  ];

  home.packages = with pkgs-unstable; [
    hyprcursor
    rose-pine-hyprcursor
  ];
  
  gtk = {
    enable = true;

    # iconTheme.package = pkgs-unstable.rose-pine-gtk-theme;
    # iconTheme.name = "rose-pine-gtk";
    # theme.package = pkgs-unstable.rose-pine-gtk-theme;
    # theme.name = "rose-pine-gtk";

    # iconTheme = {
    #   name = "Papyrus-Dark";
    #   package = pkgs-unstable.papyrus-icon-theme;
    # };
    
    # gtk3.extraconfig = { gtk-application-prefer-dark-theme = 1; };
    # gtk4.extraconfig = { gtk-application-prefer-dark-theme = 1; };
  };

  home.pointerCursor = {
    package = pkgs-unstable.rose-pine-cursor;
    name = "BreezeX-RoséPine";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  }; # TODO: Xcursor doesn't work when applied this way

  home.sessionVariables = {
    # XCURSOR_THEME = "BreezeX-RoséPine";
    XCURSOR_SIZE = toString 24;
    HYPRCURSOR_THEME = "rose-pine-hyprcursor";
    HYPRCURSOR_SIZE = toString 24;
  };
}
