{ pkgs, inputs, pkgs-unstable, ... }:

{
  home.username = "hazel";
  home.homeDirectory = "/home/hazel";

  home.stateVersion = "24.05"; # just don't fuck with it 

  # Modules
  imports = [
    ../../default/home-manager
    ./git.nix
    ./gnome.nix
   ];

  home.packages =
    # (with pkgs; [
    #
    # ])
    # ++
    ( with pkgs-unstable; [

      xournalpp

    ]);


  programs.home-manager = {
    enable = true;
  };

}
