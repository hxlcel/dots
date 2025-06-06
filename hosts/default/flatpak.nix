{
  pkgs,
  pkgs-unstable,
  ...
}: {
  services.flatpak = {
    enable = true;
  };

  ### Theoretically unnecessary due to nix-flatpak
  # systemd.services.flatpak-repo = {
  #   wantedby = ["multi-user.target "];
  #   path = [pkgs.flatpak];
  #   script = ''
  #     flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  #   '';
  # };
}
