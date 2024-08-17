{ config, pkgs, ... }:

{
	networking = {
		hostName = "daniel-nixos";
		networkmanager.enable = true;
	};
}
