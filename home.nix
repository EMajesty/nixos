{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.username = "emaj";
  home.homeDirectory = "/home/emaj";
  programs.home-manager.enable = true;

  imports = [
    inputs.zen-browser.homeModules.twilight
    ./modules/git.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/zsh.nix
    ./modules/misc.nix
    ./modules/nvf-configuration.nix
    ./modules/zen.nix
  ];

  home.stateVersion = "25.11";
}
