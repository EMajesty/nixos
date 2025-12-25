{
  config,
  pkgs,
  system,
  inputs,
  ...
}:

{
  home.username = "emaj";
  home.homeDirectory = "/home/emaj";
  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".twilight
  ];

  imports = [
    ./modules/git.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/zsh.nix
    ./modules/misc.nix
    ./modules/nvf-configuration.nix
    # ./modules/zen.nix
    ./modules/ghostty.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";

  programs.zen-browser = {
    enable = true;
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
    profiles.default.search = {
      force = true;
      default = "ddg";
    };
  };
}
