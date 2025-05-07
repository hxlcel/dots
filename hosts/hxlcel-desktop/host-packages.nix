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
      qbittorrent

      # tmux
    ]);
}
