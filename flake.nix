{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
	hyprland-contrib = {
	    url = "github:hyprwm/contrib";
		inputs.nixpkgs.follows = "nixpkgs";
	};
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
    	default = nixpkgs.lib.nixosSystem {
      		specialArgs = {inherit inputs;};
      		modules = [
       	 		./system/configuration.nix
      		];
    	};
    };
  };
}
