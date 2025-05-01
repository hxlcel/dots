{ pkgs, pkgs-unstable, ... }:
{
environment.systemPackages = [
    pkgs.ungoogled-chromium
  ];
}
