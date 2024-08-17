{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		btop
		git
		neofetch
		ripgrep
		openssl
		wget
	];
}
