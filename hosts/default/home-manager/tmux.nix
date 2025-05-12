{
  pkgs-unstable,
  inputs,
  ...
}: {
  # TODO: can i add rounded ends to the mode indicator 
  # TODO: zoomed window icon?

  programs.tmux = {
    enable = true;
    package = pkgs-unstable.tmux;
    terminal = "screen-256color";

    baseIndex = 1;

    shortcut = "a";

    keyMode = "vi";

    disableConfirmationPrompt = true;

    plugins = with pkgs-unstable.tmuxPlugins; [
      {
        plugin = rose-pine;
        extraConfig = ''
          set -g @rose_pine_variant "main"

          # set -g @rose_pine_host "on"
          # set -g @rose_pine_date_time "on"

          set -g @rose_pine_user "on"
          set -g @rose_pine_directory "on"

          # set -g @rose_pine_bar_bg_disable "on"

          # set -g @rose_pine_left_separator " > "
          # set -g @rose_pine_right_separator " < "
          set -g @rose_pine_field_separator " | "
          set -g @rose_pine_window_separator " - "

          set -g @rose_pine_session_icon ""
          set -g @rose_pine_current_window_icon ""
          set -g @rose_pine_folder_icon ""
          set -g @rose_pine_username_icon ""
          set -g @rose_pine_hostname_icon "󰒋"
          set -g @rose_pine_date_time_icon "󰃰"
          set -g @rose_pine_window_status_separator "  "
          set -g @rose_pine_status_left_prepend_section '#{tmux_mode_indicator}'
          set-option -g status-position top
        '';
      }
      sensible
      mode-indicator
      yank
      resurrect
      continuum
      vim-tmux-navigator
      {
        plugin = tmux-floax;
        extraConfig = ''
          set -g @floax-bind "p"
        '';
      }
      # strange behaviour, possibly my fault
      # TODO: learn how to use sessions
      {
        plugin = inputs.tmux-sessionx.packages.x86_64-linux.default;
        extraConfig = ''
          set -g @sessionx-bind "o"
          set -g @sessionx-zoxide-mode "on"
        '';
      }
    ];

    extraConfig = ''
      source-file ~/.dotfiles/non-nix/tmux.reset.conf # Assumes the dotfiles repo is stored in ~/.dotfiles
      set -g renumber-windows "on"
    '';
  };
}
