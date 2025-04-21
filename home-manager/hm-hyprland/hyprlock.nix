{ pkgs-unstable, ... }: {
  programs.hyprlock = {
    enable = true;
    package = pkgs-unstable.hyprlock;
    settings = {
      general = {
      };
      background = [
        {

        }
      ];
      input-field = [
        {

        }
      ];
    };
  };
}
