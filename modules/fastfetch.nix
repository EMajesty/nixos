{ config, pkgs, ... }:
{
  enable = true;
  settings = {
    logo = {
      source = "auto";
    };

    display = {
      separator = " : ";
    };
  };
}
