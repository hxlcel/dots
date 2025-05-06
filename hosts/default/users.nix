{pkgs-unstable, ...}: {
  users.users.hazel = {
    isNormalUser = true;
    home = "/home/hazel/";
    createHome = true;
    description = "Hazel";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs-unstable.zsh;
  };
}
