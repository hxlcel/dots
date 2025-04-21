{ inputs, pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = 
    ( with pkgs-unstable; [

      # Display Manager
      # ly

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

      # Fonts
      atkinson-hyperlegible-next

      # Misc
      cavalier
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
      ]))

      lua-language-server
      nixd
      gcc14
      (callPackage ./sddm-rose-pine.nix {})
    ]);
}
