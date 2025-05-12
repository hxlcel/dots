{pkgs-unstable, ...}: {
  users.users.hazel = {
    isNormalUser = true;
    home = "/home/hazel/";
    createHome = true;
    description = "Hazel";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs-unstable.zsh;

    ### if in doubt `ssh-add ~/.ssh/<key>`
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAj54ZuN0iHpbAjKLM4Cv3DjRL35Hm/AKzSRx5XQkCwD hazel@hxlcel-desktop"
    ];
  };

  # git user in host config

  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';
}
