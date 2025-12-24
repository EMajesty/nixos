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
    inputs.zen-browser.packages."${system}".specific
  ];

  imports = [
    ./modules/git.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/zsh.nix
    ./modules/misc.nix
    ./modules/nvf-configuration.nix
    # ./modules/zen.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
