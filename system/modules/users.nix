{ config, pkgs, ... }: 

{
	users.users.daniel = {
		isNormalUser = true;
		description = "daniel";
		shell = pkgs.zsh;
		extraGroups = [
			"wheel"
			"networkmanager"
		];
	};
}
