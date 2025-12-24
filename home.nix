{
  config,
  pkgs,
  ...
}: {
  home.username = "emaj";
  home.homeDirectory = "/home/emaj";
  programs.home-manager.enable = true;

  imports = [
    # ./modules/git.nix
    # ./modules/hyprland.nix
    # ./modules/neovim.nix
    # ./modules/waybar.nix
    # ./modules/zsh.nix
    # ./modules/misc.nix
    # ./modules/nvf-configuration.nix
  ];

  home.stateVersion = "25.11";
}
