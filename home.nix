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
  # home.packages = with pkgs; [
  # ];

  imports = [
    inputs.stylix.homeModules.stylix
    ./modules/git.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/zsh.nix
    ./modules/misc.nix
    ./modules/nvf-configuration.nix
    ./modules/zen.nix
    ./modules/ghostty.nix
    ./modules/stylix.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
