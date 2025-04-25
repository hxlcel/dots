{ pkgs-unstable, ...}:
{
  environment.systemPackages = ( with pkgs-unstable; [
    where-is-my-sddm-theme
  ]);

  services = {
    libinput.enable = true;
    fstrim.enable = true;
    openssh.enable = true;
    blueman.enable = true;

    ###---- Display Manager ----###
    # xserver.displayManager = {
    # gdm.enable = true;
    # sddm = {
    #   enable = true;
    #   theme = "rose-pine";
    # };
    # };

    xserver.displayManager.sddm = {
      package = pkgs-unstable.kdePackages.sddm;
      enable = true;
      theme = "where-is-my-sddm-theme";
    };

    # displayManager.ly = {
    #   package = pkgs-unstable.ly;
    #   enable = true;
    #   settings = {
    #     animation = "matrix";
    #     # bg = 
    #   };
    # };

    ### neither ly or lightdm initialise the xserver(?) session automatically
    ### need to figure out what kind of session and which file to manually give them

    # xserver.desktopManager.gnome.enable = true;

  };
}
