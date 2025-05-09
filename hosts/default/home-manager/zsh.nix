{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      osflake = "sudo nixos-rebuild switch --flake .";
      homeflake = "home-manager switch --flake ~/.dotfiles/";
      dots = "cd ~/.dotfiles/";
      config = "cd ~/.config/";
    };
    history.size = 10000;

    plugins = [
      # {
      #   name = "vi-mode";
      #   src = pkgs.zsh-vi-mode;
      #   file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      # }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [
        "tldr"
        "git"
        "direnv"
      ];
      theme = "";
    };
    initExtra = ''
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }

      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
      eval "$(direnv hook zsh)"
    '';
  };
}
