{ inputs, ... }:{
  imports = [
    inputs.sherlock.homeManagerModules.default
  ];

  programs.sherlock = {
    enable = true;
    settings = {
      aliases = {
        # vesktop = { name = "Discord"; };
        # kitty = { name = "Terminal"; };
      };
      config = {
        debug = {
          try_suppress_warnings = true;
        };
        appearance = {
          use_base_css = true;
        };
      };
      ignore = ''
      '';
      launchers = [
        {

        }
      ];
    };
  };
}
