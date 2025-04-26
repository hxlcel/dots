{ pkgs, inputs, pkgs-unstable, ... }:

{
  home.username = "hazel";
  home.homeDirectory = "/home/hazel";

  home.stateVersion = "24.05"; # just don't fuck with it 

  # Modules
  imports = [
    ./zsh.nix
    ./git.nix
    ./kitty.nix
    ./yazi.nix
    ./lazygit.nix
   ];

  # Allowed unfree packages since I can't figure out the systemwide setting.
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "obsidian"
      "vscode"
      "megacmd"
    ];

  home.packages =
    (with pkgs; [
      # Unfree
      obsidian
      megacmd
      
      hyfetch
      fastfetch
      nerdfonts
      kitty-themes
    ])
    ++
    ( with pkgs-unstable; [
      xournalpp
      libreoffice-qt6-fresh
    ]);

  programs.home-manager = {
    enable = true;
  };
  programs.vscode = {
    enable = true;
  };
  programs.firefox = {
    enable = true;
  };
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };
}
