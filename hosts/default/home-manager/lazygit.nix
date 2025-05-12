{
  pkgs-unstable,
  config,
  ...
}: {
  programs.lazygit = {
    enable = true;
    package = pkgs-unstable.lazygit;
    settings = {
      nerdFontsVersion = "2";
    };
  };
}
