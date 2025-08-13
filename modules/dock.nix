{ config, pkgs, lib, ... }:

let
  dockItems = [
    "/System/Applications/Calendar.app"
    "/Applications/Firefox.app"
    "/Applications/Visual Studio Code.app"
    "/System/Applications/System Settings.app"
  ];
in {
  # Ensure dockutil is available
  environment.systemPackages = with pkgs; [
    dockutil
  ];

  # Activation script to configure Dock
  system.activationScripts.configureDock.text = ''
    echo "Resetting and configuring Dock..."

    # Remove all existing Dock items
    ${pkgs.dockutil}/bin/dockutil --remove all --no-restart

    # Add apps from the list
    ${lib.concatStringsSep "\n" (map (app: ''
      ${pkgs.dockutil}/bin/dockutil --add "${app}" --no-restart
    '') dockItems)}

    # Restart Dock to apply changes
    killall Dock || true
  '';
}