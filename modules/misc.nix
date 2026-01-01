{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;
  };
  services.udiskie = {
    enable = true;
    automount = true;
  };
  services.hypridle = {
    enable = true;
  };
  programs.mullvad-vpn.enable = true;
}
