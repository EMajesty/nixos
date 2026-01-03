{ config, pkgs, ... }:

{
  home.packages = [ pkgs.hyprpaper ];

  home.file.".local/bin/random-hyprpaper.sh" = {
    text = ''
      #!/usr/bin/env bash
      set -euo pipefail

      WALLPAPER_DIR="$HOME/Pictures/wallpapers"

      # Pick first monitor; tweak if you want per‑monitor handling
      MONITOR="$(hyprctl monitors -j | jq -r '.[0].name')"

      WALLPAPER="$(find "$WALLPAPER_DIR" -type f | shuf -n 1)"

      hyprctl hyprpaper preload "$WALLPAPER"
      hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER"
      sleep 1
      hyprctl hyprpaper unload unused
    '';
    executable = true;
  };

  systemd.user.services.random-hyprpaper = {
    Unit = {
      Description = "Set random wallpaper with hyprpaper";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "%h/.local/bin/random-hyprpaper.sh";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  systemd.user.timers.random-hyprpaper = {
    Unit = {
      Description = "Periodically change wallpaper via hyprpaper";
    };
    Timer = {
      OnBootSec = "1min";
      OnUnitActiveSec = "15min"; # change interval here
      Persistent = true;
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
