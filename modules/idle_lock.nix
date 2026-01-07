{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        blur_passes = 3;
      };
      input-field = {
        size = "6666, 100";
        inner_color = lib.mkForce "rgba(00000000)";
        outline_thickness = 0;
        font_color = lib.mkForce "rgba(255,217,179,1.0)";
        fail_color = lib.mkForce "rgba(FF0000FF)";
        placeholder_text = "$TIME";

        rounding = 0;
        shadow_passes = 0;
        fade_on_empty = false;
      };
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
