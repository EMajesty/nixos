{ config, pkgs, ... }:

{
  services.udiskie = {
    enable = true;
    automount = true;
  };
  services.hypridle = {
    enable = true;
  };
}
