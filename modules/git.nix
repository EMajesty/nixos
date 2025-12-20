{ config, pkgs, ... }:

{
	programs.git = {
		enable = true;
		settings = {
			user.name = "EMajesty";
			user.email = "lassi.laitinen@protonmail.com";
			init.defaultBranch = "main";
		};
	};
}
