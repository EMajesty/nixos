{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
  };
  services.udiskie = {
    enable = true;
    automount = true;
  };
  services.hypridle = {
    enable = true;
  };
  services.swww = {
    enable = true;
  };
  programs.waybar = {
    enable = true;
    style = "./waybar.css";
    systemd.enable = true;
  };
}
