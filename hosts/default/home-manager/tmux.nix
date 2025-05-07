{pkgs-unstable, ...}: {
  programs.tmux = {
    enable = true;
    package = pkgs-unstable.tmux;
    terminal = "tmux-256color";

    shortcut = "a";

    plugins = with pkgs-unstable.tmuxPlugins; [
      sensible
      {
        plugin = rose-pine;
        extraConfig = "set -g @rose_pine_variant 'main'";
      }
    ];
  };
}
