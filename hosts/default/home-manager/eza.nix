{pkgs-unstable, ...}: {
  enable = true;
  package = pkgs-unstable.eza;
  enableZshIntegration = true;
  icons = "auto";
}
