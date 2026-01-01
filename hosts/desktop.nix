{ config, pkgs, ... }:

{
  networking.hostName = "psyche";

  imports = [ ];

  boot.initrd.kernelModules = [ "amdgpu" ];
}
