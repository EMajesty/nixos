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

      modules = [
        {
          type = "title";
          key = "";
          format = "{user-name}@{host-name}";
        }
      ];
    };
  };
}
