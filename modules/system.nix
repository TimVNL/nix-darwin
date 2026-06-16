{ pkgs, ... }:

  ###################################################################################
  #
  #  macOS's System configuration
  #
  #  All the configuration options are documented here:
  #    https://daiderd.com/nix-darwin/manual/index.html#sec-options
  #
  ###################################################################################
{
  system = {
    stateVersion = 6;

    defaults = {
      menuExtraClock.Show24Hour = true;  # show 24 hour clock

      # customize settings that not supported by nix-darwin directly
      # Incomplete list of macOS `defaults` commands :
      # https://github.com/yannbertrand/macos-defaults
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Always";
       # AppleInterfaceStyle = "Dark";
        AppleInterfaceStyleSwitchesAutomatically = false;
        "com.apple.swipescrolldirection" = false;  # disable natural scrolling(default to true)
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
        AppleInterfaceStyle = "Dark";  # dark mode
        NSNavPanelExpandedStateForSaveMode = true;  # expand save panel by default
        NSNavPanelExpandedStateForSaveMode2 = true;
      };
      # END NSGlobalDomain

      # Dock settings
      dock = {
        autohide = true;
        show-recents = false;  # disable recent apps
        tilesize = 48
      };
      # END dock

      # Finder settings
      finder = {
        FXDefaultSearchScope = "SCcf"; # Change the default search scope current folder
        FXPreferredViewStyle = "Nlsv"; # Change the default finder view to list
        AppleShowAllExtensions = true;  # show all file extensions
        QuitMenuItem = true;  # enable quit menu item
        ShowPathbar = true;  # show path bar
        ShowStatusBar = true;  # show status bar
        NewWindowTarget = "Home"; # Change the default folder shown in Finder windows. 
      };
      # END finder

      # Trackpad settings
      trackpad = {
        TrackpadCornerSecondaryClick = 2 # secondary click set bottom-right corner
      }; 
      # END trackpad

      # Screen Capture settings
      screencapture = {
        disable-shadow = true;
      }; 
      # END screencapture

      # other macOS's defaults configuration.
      # ......

    }; # END defaults
  }; # END system

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true; # Enables autocomplete
  }; 
  # END programs.zsh

}
