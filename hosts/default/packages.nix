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
      # git
      monitor
      kdePackages.dolphin

      # wget
      # mokutil
      # samba
      # cabextract

      # CLI
      ripgrep
      fzf
      fd
      bat
      tree
      unzip
      zoxide
      # eza # hm opts

      # Fonts
      atkinson-hyperlegible-next

      # Misc
      cavalier
      blackmagic # MCU debugging tool
      usbutils
      libudev-zero # libudev is a via-cli depandancy which doesn't seem to be available on it's own

      # Windows Compatibility
      wineWowPackages.stable
      winetricks
      # heroic (?)

      # Keyboards
      kanata

      # Git
      gitFull
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

      ### C
      # C LSP
      clang
      clang-tools # Includes clangd, clang-tidy, clang-format etc.
      cppcheck
      gnumake

      # Lua
      luajit
      lua-language-server
      stylua

      # Nix
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
