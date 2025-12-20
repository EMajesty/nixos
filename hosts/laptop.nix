{ config, pkgs, ... }:

{
	networking.hostName = "antares";

	imports = [
		../hardware/laptop-hardware.nix
	];

	services.power-profiles-daemon.enable = true;
	# services.tlp.enable = true;

	services.logind.settings = {
		Login = {
			HandleLidSwitch = "suspend";
		};
	};
}
