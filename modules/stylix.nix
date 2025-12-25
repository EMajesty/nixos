{ config, pkgs, ... }:
{
  stylix.enable = true;
  stylix.image = ../../Pictures/wallpapers/wallpaper.png;
  stylix.fonts = {
    serif = config.stylix.fonts.monospace;
    sansSerif = config.stylix.fonts.monospace;
    emoji = config.stylix.fonts.monospace;
  };
}
