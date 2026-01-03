{ config, pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "auto";
      };

      display = {
        separator = " : ";
      };
    };
  };
}
