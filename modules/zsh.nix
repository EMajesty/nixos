{ config, pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
			gs = "git status";
			ls = "eza -lh --group-directories-first --icons=auto";
			lsa = "ls -a";
			lt = "eza --tree --level=2 --long --icons --git";
			lta = "lt -a";
		};
		oh-my-zsh = {
			enable = true;
			theme = "agnoster";
			plugins = [ "git" "sudo" ];
		};
	};
}
