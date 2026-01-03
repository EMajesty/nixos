{
  config,
  pkgs,
  system,
  inputs,
  lib,
  ...
}:

{
  home.username = "emaj";
  home.homeDirectory = "/home/emaj";
  # home.packages = with pkgs; [
  # ];

  imports = [
    ./modules/git.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/zsh.nix
    ./modules/misc.nix
    ./modules/nvf-configuration.nix
    ./modules/zen.nix
    ./modules/ghostty.nix
    ./modules/random_hyprpaper.nix
  ];

  stylix = {
    image = "Pictures/wallpapers/city.jpg";
    targets = {
      hyprpaper.enable = lib.mkForce false;
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
