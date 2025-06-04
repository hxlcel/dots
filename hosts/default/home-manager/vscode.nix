{
  pkgs,
  pkgs-unstable,
  ...
}: {
  # Notes:
  # Emergency IDE.
  # Start form terminal w/ project environment loaded.

  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode.fhs;
    extensions = with pkgs-unstable.vscode-extensions; [
      ms-python.python
      ms-python.vscode-pylance
      mvllow.rose-pine
      vscodevim.vim
    ];
    # profiles = {
    #   default = {

    # userSettings = {
    #   # --- Testing Configuration ---
    #   "python.testing.pytestEnabled" = true;
    #   "python.testing.unittestEnabled" = false;
    #   "python.testing.nosetestsEnabled" = false;
    #   "python.testing.pytestArgs" = ["."];
    #
    #   # --- Linting and Type Checking ---
    #   "python.linting.enabled" = true;
    #   "python.linting.flake8Enabled" = true;
    #   "python.linting.mypyEnabled" = true;
    #   "python.analysis.typeCheckingMode" = "standard";
    #
    #   # --- Formatting ---
    #   "python.formatting.provider" = "black";
    #
    #   # --- Environment Activation ---
    #   "python.termial.activateEnvironment" = true;
    #
    #   # --- Theme ---
    #   # "workbench.colorTheme" = "Abyss";
    #   "workbench.colorTheme" = "Rosé Pine";
    #
    #   "workbench.iconTheme" = "rose-pine-icons";
    # };

    #   };
    # };
  };
}
