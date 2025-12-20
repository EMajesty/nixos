{
	description = "NixOS";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ...}@inputs:
	let
		system = "x86_64-linux";
	in {
		nixosConfigurations = {
			laptop = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs self; };
				modules = [
					./modules/common.nix
					./hosts/laptop.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.emaj = import ./home.nix;
					}
				];
			};

			desktop = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs self; };
				modules = [
					./modules/common.nix
					./hosts/desktop.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.emaj = import ./home.nix;
					}
				];
			};
		};
	};
}
