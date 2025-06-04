{
  pkgs-unstable,
  config,
  ...
}: {
  # TODO: set commit editor, set loading animation to firacode icons
  programs.lazygit = {
    enable = true;
    package = pkgs-unstable.lazygit;
    settings = {
      nerdFontsVersion = "2";
    };
  };
}
