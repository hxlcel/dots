{pkgs-unstable, ...}: {
  environment.systemPackages = with pkgs-unstable; [
    appimage-run
  ];

  services.flatpak.enable = true;

  # services.flatpak = {
  #   enable = true;
  #
  #   ### for nix-flatpak, can't figure it out.
  #   packages = [
  #     # {
  #     #   appId = "app.zen-browser.zen";
  #     #   origin = "flathub";
  #     # }
  #     {
  #       appId = "com.spotify.Client";
  #       origin = "flathub";
  #     }
  #   ];
  # };
  #
  # systemd.services.flatpak-repo = {
  #   wantedby = ["multi-user.target "];
  #   path = [pkgs.flatpak];
  #   script = ''
  #     flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  #   '';
  # };
}
