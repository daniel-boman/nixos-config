{
	inputs, stdenv, ...
}:
let
	ags = inputs.ags.packages.${system}.default.override {
		extraPackages = [
			accountsservice
		];	
	};

	dependencies = [
		gtk3
		pavucontrol	
	];

	config = stdenv.mkDerivation {
		src = ./.;

		buildPhase = ''
			
		'';

		installPhase = ''
			mkdir -p $out
			cp -r . $out
		'';
	};
in
	stdenv.mkDerivation {
		src = config;

		installPhase = ''
			mkdir -p $out/bin
			cp -r . $out
			
		'';
	}
