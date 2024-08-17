{ config, pkgs, inputs, lib, ... }:

{
	imports = [
		./hyprland.nix	
		./packages.nix
		./environment.nix
		./gtk.nix
		./swaylock.nix
		./mako.nix
		./swayidle.nix
		./hyprpaper.nix
		./waybar.nix
		./wlogout.nix
	];
}
