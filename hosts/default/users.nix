{pkgs-unstable, ...}: {
  users.users.hazel = {
    isNormalUser = true;
    home = "/home/hazel/";
    createHome = true;
    description = "Hazel";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs-unstable.zsh;
  };

  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';
}
