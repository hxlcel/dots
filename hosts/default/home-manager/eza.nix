{pkgs-unstable, ...}: {
  programs.eza = {
    enable = true;
    package = pkgs-unstable.eza;
    enableZshIntegration = true;
    icons = "auto";
  };
}
