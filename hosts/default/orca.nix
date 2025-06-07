{pkgs, ...}: let
  pname = "orcaSlicer";
  version = "2.3.0";

  src = pkgs.fetchurl {
    url = "https://github.com/SoftFever/OrcaSlicer/releases/download/v2.3.0/OrcaSlicer_Linux_AppImage_V2.3.0.AppImage";
    sha256 = "00qc2m041z3w5a353q56ics1wc7y4sm017cinxfn3w1nxj49s1vk";
  };
  appimageContents = pkgs.appimageTools.extract {inherit pname version src;};
in
  pkgs.appimageTools.wrapType2 {
    inherit pname version src;
    pkgs = pkgs;
    extraInstallCommands = ''
      # Create applications directory
      mkdir -p $out/share/applications

      # Write the .desktop file
      cat > $out/share/applications/${pname}.desktop <<EOF
      [Desktop Entry]
      Version=${version}
      Name=Orca Slicer
      Exec=${pname}
      Icon=orca-slicer
      Type=Application
      Categories=Graphics;3DGraphics;
      EOF

      # Copy icons
      cp -r ${appimageContents}/usr/share/icons $out/share || true
    '';

    extraBwrapArgs = [
      "--bind-try /etc/nixos/ /etc/nixos/"
    ];

    dieWithParent = false;

    extraPkgs = pkgs:
      with pkgs; [
        webkitgtk
        gtk3
        glib
        libdrm
        xdg-utils
        gsettings-desktop-schemas
        unzip
        autoPatchelfHook
        asar
        (buildPackages.wrapGAppsHook.override {inherit (buildPackages) makeWrapper;})
      ];
  }
