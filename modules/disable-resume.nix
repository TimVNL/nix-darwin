{ lib, ... }:
{
  system.activationScriptsScript = lib.mkAfter ''
    echo "Disabling macOS application resume..."
    /usr/bin/defaults write -g NSQuitAlwaysKeepsWindows -bool false
    /usr/bin/defaults write com.apple.loginwindow LoginwindowTALLogoutSavesState -bool false
    /usr/bin/defaults write -g ApplePersistence -bool no
  '';
}