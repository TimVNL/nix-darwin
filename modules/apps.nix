{ pkgs, ...}: {

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    git
    dockutil # A nix module that arranges the macOS dock
    htop
  ]; #END systemPackages

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      #cleanup = "zap";
    }; #END onActivation

    caskArgs = {
      appdir = "~/Applications";
      #require_sha = true;
    }; #END caskArgs

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      # "curl" 
    ];
    # END brews

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      "1password"
      "firefox"
      "google-chrome"
      "maccy"
      "obsidian"
      "puremac"
      "slack"
      "spotify"
      "visual-studio-code"
      "whatsapp"
    ]; #END casks
  }; #END homebrew
} #END
