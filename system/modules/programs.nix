{ config, pkgs, ... }:

{
	xdg.portal = {
		enable = true;
		wlr.enable = false;
		xdgOpenUsePortal = false;

		extraPortals = [
			pkgs.xdg-desktop-portal-hyprland
			pkgs.xdg-desktop-portal-gtk
		];	
	};

	programs = {
		steam = {
			enable = true;
		};

		hyprland = {
			enable = true;

			xwayland = {
				enable = true;
			};

			portalPackage = pkgs.xdg-desktop-portal-hyprland;
		};

		gnupg = {
			agent = {
				enable = true;
				enableSSHSupport = true;
				pinentryPackage = pkgs.pinentry-curses;
			};
		};


		zsh.enable = true;
		mtr.enable = true;
	};
}
