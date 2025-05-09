{
  inputs,
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages =
    (with pkgs-unstable; [
      ###---- Editor ----###
      neovim
      vim # Emergency editor

      ###---- Termial ----###
      ghostty
      tmux # terminal multiplexer

      ###---- Utilities ----###
      manix # Nix option documentation
      jellyfin-ffmpeg
      lz4
      git
      monitor
      kdePackages.dolphin

      # CLI
      ripgrep
      fzf
      fd
      bat
      tree
      unzip
      zoxide
      eza

      # Fonts
      atkinson-hyperlegible-next

      # Misc
      cavalier

      # Git
      gitg

      ###---- Language Servers, Linters, Formatters ----###

      direnv # Loads Nix based virtual dev environments automatically.

      ### Python
      (python313.withPackages (ps:
        with ps; [
          python-lsp-server
          flake8
          mypy
          black
          # pytest # <-----
          # pytest-mock # <- Install according to project environment
          debugpy
          pynvim
        ]))

      luajit
      lua-language-server
      stylua

      nixd
      alejandra

      gcc14
    ])
    ++ (with pkgs; [
      gtk-engine-murrine
      gnome-themes-extra
      sassc
      inputs.zen-browser.packages."${system}".default
    ]);
}
