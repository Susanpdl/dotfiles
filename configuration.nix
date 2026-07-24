{ user, ... }:

{
  # Determinate already manages the Nix daemon, so nix-darwin shouldn't.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin"; # use x86_64-darwin for Intel CPU

  system.primaryUser = user;
  users.users.${user} = {
    home = "/Users/${user}";
  };
  system.stateVersion = 6;
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;          # fast key repeat
      InitialKeyRepeat = 15;  # short delay before repeat
      _HIHideMenuBar = true;  # auto-hide the menu bar
      AppleShowAllExtensions = true;
    };
    dock.autohide = true;
    finder.FXPreferredViewStyle = "Nlsv";  # list view by default
    finder.CreateDesktop = false;          # clean desktop
    trackpad.Clicking = true;              # tap to click
  };
  nix-homebrew = {
    enable = true;
    inherit user;
    autoMigrate = true;
  };
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";  # remove anything not listed here
    onActivation.autoUpdate = true;
    onActivation.extraFlags = [ "--force" ];
    taps = [
      "mongodb/brew"
    ];
    brews = [
      "gh"
      "go-task"
      "libomp"
      "mongodb/brew/mongodb-community"
      "mongodb/brew/mongodb-database-tools"
      "mongosh"
      "mysql"
      "nasm"
      "nvm"
      "pkgconf"
      "poetry"
      "postgresql@16"
      "protobuf"
      "python@3.11"
      "rustup"
      "sdl2_image"
      "sdl2_mixer"
      "sdl2_ttf"
      "tectonic"
      "tmux"
      "uv"
    ];
    casks = [
      "claude-code"
      "copilot-cli"
      "maccy"
      "ngrok"
      "pgadmin4"
      "wezterm"
    ];
  };
}
