{ config, pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    targets = {
      # neovim.enable = false;
      # nvf.enable = false;
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/evergreen.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/penumbra-dark.yaml";
    image = pkgs.fetchurl {
      url = "https://i.redd.it/7oxaztid8wud1.png";
      hash = "sha256-OVmNYW4QzGnzIc7+H8Hdxso10LlRbzgnkfjxDa42VZs=";
    };
    polarity = "dark";
  };
}
