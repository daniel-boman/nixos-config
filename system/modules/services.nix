{ config, pkgs, ... }:

{
	environment.systemPackages = [
		(
			pkgs.catppuccin-sddm.override {
				flavor = "mocha";
				font = "Noto Sans";
				fontSize = "9";
				#background = "${}";
				loginBackground = true;
			}
		)
	];
	services = {
		dbus.enable = true;
		picom.enable = true;
		xserver = {
			enable = true;
			layout = "no";
			xkbOptions = "grp:alt_shift_toggle, caps:swapescape";
			displayManager = {
				sddm.enable = true;
				sddm.theme = "catppuccin-mocha";
				sddm.package = pkgs.kdePackages.sddm;
#				sddm.theme = "${import ./sddm.nix { inherit pkgs; }}";
#				sddm.extraPackages = pkgs.lib.mkForce [ pkgs.libsForQt5.qt5.qtgraphicaleffects  ];
			};
		};
	};
}
