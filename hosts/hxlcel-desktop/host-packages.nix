{
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      ungoogled-chromium
    ])
    ++ (with pkgs-unstable; [
      rofimoji # TODO: For unicode, need more time to understand
      qbittorrent
      # tmux
      kicad
      freecad-wayland
      vlc
      firefoxpwa
      pineflash
    ]);

  environment.variables = {
    MY3DMOD = "/home/hazel/kicad/3dmodels";
    KICAD6_3DMODEL_DIR = "/home/hazel/kicad/3dmodels";
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts.packages = [pkgs-unstable.firefoxpwa];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
