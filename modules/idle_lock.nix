{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      backgrounds = [
        {
          blur_size = 8;
          blur_passes = 3;
        }
      ];
    };
  };

  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 600;
          on-timeout = "pidof hyprlock || hyprlock";
        }
        {
          timeout = 900;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
