{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./kitty.nix
    ./zsh.nix
    ./yazi.nix
    ./lazygit.nix
    ./tmux.nix
  ];

  ### config directory ###
  home.file = {
    # ".config/nvim" = {
    #   recursive = true;
    #   # source = config.lib.file.mkOutOfStoreSymlink "/home/hazel/.dotfles/non-nix/nvim";
    #   source = config.lib.file.mkOutOfStoreSymlink ../../../non-nix/nvim;
    # };

    ".config/ghostty" = {
      recursive = true;
      source = ../../../non-nix/ghostty;
    };

    # ".config/tmux/tmux.conf".source = ../../../non-nix/tmux.conf;
    ".config/starship.toml".source = ./starship.toml;
  };

  # Avoiding Nix Store Immutability
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/hazel/.dotfiles/non-nix/nvim";

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
    ++ (with pkgs-unstable; [
      libreoffice-qt6-fresh
    ]);

  programs.direnv = {
    enable = true;
    package = pkgs-unstable.direnv;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.vscode = {
    enable = true;
  };
  programs.firefox = {
    enable = true;
  };
  programs.starship = {
    enable = true;
    # settings = pkgs.lib.importTOML ./starship.toml;
  };
}
