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

      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Always";
        AppleInterfaceStyle = "Dark";
        AppleInterfaceStyleSwitchesAutomatically = false;
        "com.apple.swipescrolldirection" = false;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
      };

      #dock
      dock = {
        # Hide Dock automatically
        autohide = false;

        # Set icon size
        tilesize = 46;
        
        # Show recent applications in the dock.
        show-recents = false;
        
        # Define pinned apps
        persistent-apps = [
          "/Applications/Firefox.app"
          "/Applications/Visual Studio Code.app"
        ];
      }; # END dock

      # Finder
      finder = {
        FXDefaultSearchScope = "SCcf"; # Change the default search scope current folder
        FXPreferredViewStyle = "Nlsv"; # Change the default finder view to list
        ShowPathbar = true; # Show path breadcrumbs in finder windows
        ShowStatusBar = true; # Show status bar at bottom of finder windows with item/disk space stats
        NewWindowTarget = "Home"; # Change the default folder shown in Finder windows. 
      };

      # Screen Capture
      screencapture = {
        disable-shadow = true;
      };

    }; # END defaults
  }; # END system 



  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true; # Enables autocomplete
  }; # END programs.zsh

}
