{ pkgs, pkgs-unstable, ... }:
{

  imports = [
    ./kitty.nix
    ./zsh.nix
    ./yazi.nix
    ./lazygit.nix
  ];

  ### config directory ###
  home.file = {

    ".config/nvim" = {
      recursive = true;
      source = ../../../non-nix/nvim;
    };

    ".config/ghostty" = {
      recursive = true;
      source = ../../../non-nix/ghostty;
    };

  };


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
      libreoffice-qt6-fresh
    ]);


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
