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
}
