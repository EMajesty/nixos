{ config, pkgs, ... }:

{
  networking.hostName = "psyche";

  imports = [ ];

  boot.kernelModules = [ "kvm-amd" ];
  boot.initrd.kernelModules = [ "amdgpu" ];

  environment.systemPackages = with pkgs; [
    godot
    krita
  ];
}
