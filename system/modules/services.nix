{ config, pkgs, ... }:

{
	services = {
		dbus.enable = true;
		picom.enable = true;
		xserver = {
			enable = true;
			layout = "no";
			xkbOptions = "grp:alt_shift_toggle, caps:swapescape";
			displayManager = {
				sddm.enable = true;
				sddm.theme = "${import ./sddm.nix { inherit pkgs; }}";
			};
		};
	};
}
