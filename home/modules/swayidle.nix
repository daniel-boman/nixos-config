{ config, pkgs, inputs, ... }: 


{
	services.swayidle = {
		enable = true;

		timeouts = [
			{ timeout = 120; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
			{ timeout = 500; command = "${pkgs.systemd}/bin/systemctl suspend";}
		];

		events = [
			{ event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock"; }
		];
	};
}
