{ pkgs, ... }:

{
  system = {
    stateVersion = 6;

    defaults = {
      menuExtraClock.Show24Hour = true; # show 24 hour clock

      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Always";
        AppleInterfaceStyle = "Dark";
        AppleInterfaceStyleSwitchesAutomatically = false;
        "com.apple.swipescrolldirection" = false;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
      };

      dock = {
        autohide = false;
        tilesize = 46;
        show-recents = false;
        persistent-apps = [
          "/Applications/Firefox.app"
          "/Applications/Visual Studio Code.app"
        ];
      };

      finder = {
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "Nlsv";
        ShowPathbar = true;
        ShowStatusBar = true;
        NewWindowTarget = "Home";
      };

      screencapture = {
        disable-shadow = true;
      };
    };

    # TouchID for sudo
    security.pam.services.sudo_local.touchIdAuth = true;

    programs.zsh = {
      enable = true;
      enableCompletion = true;
    };
  };
}