{ config, pkgs, inputs, self, ... }:

{
	swapDevices = [
		{
			device = "/var/lib/swapfile";
			size = 16 * 1024;
		}
	];

	boot.loader.limine.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.kernelPackages = pkgs.linuxPackages_latest;
	services.displayManager.ly.enable = true;

	networking.networkmanager.enable = true;
	services.openssh.enable = true;

	time.timeZone = "Europe/Helsinki";

	users.users.emaj = {
		isNormalUser = true;
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
	};

	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
	ghostty
	nautilus
	eza
	fastfetch
	];

	environment.pathsToLink = [
		"/share/applications"
		"/share/xdg-desktop-portal"
	];

	programs.zsh.enable = true;

	programs.hyprland.enable = true;

	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-color-emoji
	];

	programs.nix-ld.enable = true;
	programs.nix-ld.libraries = with pkgs; [
		# Add any missing dynamic libraries for unpackaged
		# programs here, NOT in environment.systemPackages
	];

	system.autoUpgrade = {
		enable = true;
		flake = inputs.self.outPath;
		flags = [
			"--update-input"
			"nixpkgs"
			"-L"
		];
		dates = "09:00";
		randomizedDelaySec = "45min";
	};

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.stateVersion = "25.11";
}
