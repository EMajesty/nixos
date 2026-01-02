{ config, pkgs, ... }:

{
  networking.hostName = "psyche";

  imports = [ ];

  boot.initrd.kernelModules = [ "amdgpu" ];

  environment.systemPackages = with pkgs; [
    godot
    krita
  ];
}
