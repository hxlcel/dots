### Configuration for *basic* look and feel of various windows, popups, etc.
{ lib, ... }:
let
  rule = rules: attrs: attrs // { inherit rules; };
in {
  wayland.windowManager.hyprland.layerRules = [{
    namespace = [ "rofi" "notification" ];
    rules = [ "blur" "ignorezero" ];
  }];

  wayland.windowManager.hyprland.windowRules = let
 
    ###---- WINDOW DEFINITIONS ----###

    # System utilities
    systemMonitor.class = [ "monitor" ];
    audioControl.class = [ "pavucontrol-qt" ];
    bluetoothControl = {
      class = [ ".*blueman-manager.*" ];
      title = [ "Bluetooth Devices" ".*blueman-manager.*" ];
    };

    ###---- RULES ----###
  in lib.concatLists [
      [
        (rule [ "size 530 600" ] bluetoothControl)
      ]
      # Transparency level 1
      (map (rule [ "opacity 0.97 0.97" ]) [ ])
      (map (rule [ "opacity 0.97 0.97" "float" ]) [
        audioControl
        bluetoothControl
        systemMonitor
      ])
      # Transparency level 2
      (map (rule [ "opacity 0.75 0.75" "float" ]) [
      ])
    ];
}
