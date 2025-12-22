{
	description = "NixOS";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/release-25.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ...}:
	let
		system = "x86_64-linux";
		commonModules = [
			./modules/common.nix
			home-manager.nixosModules.home-manager
			{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.emaj = import ./home.nix;
			}
		];
	in {
		nixosConfigurations = {
			laptop = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit self; };
				modules = commonModules ++ [
					./hosts/laptop.nix
				];
			};

			desktop = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit self; };
				modules = commonModules ++ [
					./hosts/desktop.nix
				];
			};
		};
	};
}
