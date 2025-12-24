{
  config,
  pkgs,
  ...
}:

let
  inputs = config._module.args.inputs;
in
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
