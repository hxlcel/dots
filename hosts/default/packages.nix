{
  inputs,
  pkgs,
  pkgs-unstable,
  orcaAppImage,
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

      # CLI
      ripgrep
      fzf
      fd
      bat
      tree
      zip
      unzip
      zoxide
      htop

      # Fonts
      atkinson-hyperlegible-next

      # Misc
      cavalier
      blackmagic # MCU debugging tool
      usbutils
      libudev-zero # libudev is a via-cli depandancy which doesn't seem to be available on it's own

      # Windows Compatibility
      openssl
      # wineWowPackages.stable
      wine
      winetricks
      bottles
      # heroic (?)

      # Keyboards
      kanata
      qmk
      qmk_hid
      qmk-udev-rules
      vial

      # Git
      gitFull
      gitg

      ###---- Language Servers, Linters, Formatters ----###

      direnv # Loads Nix based virtual dev environments automatically.

      ### Python
      (python313.withPackages (ps:
        with ps; [
          # TODO: Spell checking solution; Python style favours US english
          python-lsp-server
          flake8
          mypy
          black
          ruff # Experimental, Not in current setup, More complicated than just using it as a pylsp plugin
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

      # HTML & CSS
      emmet-ls
      vscode-langservers-extracted
      live-server # local network server with live reload

      gcc14
    ])
    ++ (with pkgs; [
      gtk-engine-murrine
      gnome-themes-extra
      sassc

      # 3D Printing
      orcaAppImage # Custom derivation for appimage version.
    ]);
}
