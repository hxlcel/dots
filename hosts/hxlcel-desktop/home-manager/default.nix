{ pkgs, inputs, pkgs-unstable, ... }:

{
  home.username = "hazel";
  home.homeDirectory = "/home/hazel";

  home.stateVersion = "24.05"; # just don't fuck with it 

  # Modules
  imports = [
    inputs.hyprnix.homeManagerModules.default
    ./hm-hyprland
    ../../default/home-manager
    ./wayland
    ./xdg.nix
    ./git.nix
  ];

  home.packages =
    # (with pkgs; [
    # ])
    # ++
    ( with pkgs-unstable; [
      youtube-music
      vesktop
    ]);


  programs.home-manager = {
    enable = true;
  };
}
