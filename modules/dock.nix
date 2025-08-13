{ config, pkgs, lib, ... }:

let
  dockItems = [
    # Left side — Finder first
    "/System/Library/CoreServices/Finder.app"

    # Your apps
    "/System/Applications/Calendar.app"
    "/Applications/Firefox.app"
    "/Applications/Visual Studio Code.app"
    "/System/Applications/System Settings.app"

    # Right side — Downloads folder
    { folder = "${config.users.users.${config.networking.hostName}.home}/Downloads";
      view = "grid";
      display = "folder";
      sort = "dateadded";
    }

    # Right side — Trash last
    "/System/Volumes/Data/.Trash"
  ];

  addItem = item:
    if builtins.isString item then
      ''${pkgs.dockutil}/bin/dockutil --add "${item}" --no-restart''
    else
      ''${pkgs.dockutil}/bin/dockutil --add "${item.folder}" --view ${item.view} --display ${item.display} --sort ${item.sort} --no-restart'';

  dockScript = ''
    echo "Resetting and configuring Dock..."

    # Kill Dock to ensure no cached state interferes
    killall Dock || true
    sleep 1

    # Remove all persistent apps and others
    ${pkgs.dockutil}/bin/dockutil --remove all --no-restart || true
    ${pkgs.dockutil}/bin/dockutil --remove '' --no-restart || true

    # Add apps, folders, and special items from the list
    ${lib.concatStringsSep "\n" (map addItem dockItems)}

    # Restart Dock to apply changes
    killall Dock || true
  '';
in {
  environment.systemPackages = with pkgs; [
    dockutil
  ];

  system.activationScripts.configureDock.text = dockScript;
}