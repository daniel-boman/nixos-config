{ config, pkgs, inputs, lib, ... }:

{
	nixpkgs.config = {
		allowUnfree = true;
		allowUnfreePredicate = pkg:
			builtins.elem (lib.getName pkg) [
				"spotify"
				"discord"	
			];
	};
	imports = [
		./programs/hyprland.nix	
		./programs/discord.nix
		./programs/spotify.nix
	];
}
