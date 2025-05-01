{ pkgs-unstable, ... }:
{
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs-unstable.gnomeExtensions;
        [
          blur-my-shell.extensionUuid
        ];
    };
  };
}
