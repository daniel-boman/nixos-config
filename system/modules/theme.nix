{ pkgs, ... }: 

{
	environment.systemPackages = with pkgs; [
		gnome3.adwaita-icon-theme
		glib
		gsettings-desktop-schemas

		nwg-look	
	];
}
