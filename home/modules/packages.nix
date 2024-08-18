{ config, pkgs, inputs, lib, ...}:

let 
	unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in
{
	nixpkgs.config = {
		allowUnfree = true;
		allowUnfreePredicate = pkg: true;
	};


	home.packages = with pkgs; [
			
		jetbrains.rust-rover
		jetbrains.goland

		go
		rustup

		blueberry
		steam
		steam-run

		catppuccin-cursors.macchiatoBlue
		catppuccin-gtk
		papirus-folders

		discord
		spotify
#		spotifywm
	];
	
}
