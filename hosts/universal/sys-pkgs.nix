{ inputs, pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = 
    ( with pkgs-unstable; [

      # Editor
      neovim
      vim # Emergency editor

      # Utilities
      manix # Nix option documentation
      jellyfin-ffmpeg
      lz4
      git
      monitor

      # CLI
      ripgrep
      fzf
      fd
      bat
      tree
      unzip
      zoxide

      # Fonts
      atkinson-hyperlegible-next

      # Misc
      cavalier

      # Git
      gitg

    ])

    ++

    ( with pkgs; [
      gtk-engine-murrine
      gnome-themes-extra
      sassc
      inputs.zen-browser.packages."${system}".default

      # Language Servers
      python3
      (python312.withPackages (ps: with ps; [
        python-lsp-server
        flake8
        mypy
        pytest
        pytest-mock
      ]))

      lua-language-server
      nixd
      gcc14
      # (callPackage ./sddm-rose-pine.nix {})
    ]);
}
