{ config, pkgs, inputs, lib, ... }:

{
	services.hyprpaper = {
		enable = true;
		settings = {
			splash = false;
			preload = [
				"./config/wall.png"
			];

			wallpaper = [
				"DP-1,./config/wall.png"
			];
		};
	};
}
