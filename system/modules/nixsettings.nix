{ config, pkgs, ... }:

{
	nixpkgs.config.allowUnfree = true;

	nix = {
		settings.auto-optimise-store = true;
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 7d";
		};
	};
}
