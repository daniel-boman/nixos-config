{ config, pkgs, ... }:

{


	environment.systemPackages = with pkgs; [
		btop
		git
		neofetch
		ripgrep
		fd
		openssl
		wget
		
#		(pkgs.callPackage ./waybar-media-player.nix {})
	];
}
