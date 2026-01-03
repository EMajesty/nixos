{ ... }:

{
  services.random-background = {
    enable = true;
    imageDirectory = "%h/Pictures/wallpapers";
    interval = "1m";
  };
}
