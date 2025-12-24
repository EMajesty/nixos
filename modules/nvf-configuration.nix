{
  pkgs,
  lib,
  ...
}: {
  enable = true;
  preset = minimal;

settings = {
                coloscheme = "tokyonight";
                enableLsp = true;
                enableTreesitter = true;
        }
}
