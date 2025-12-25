{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "dracula";
      #   background-opacity = "0.8";
      #   background-blur = true;
      #   confirm-close-surface = false;
    };
  };
}
