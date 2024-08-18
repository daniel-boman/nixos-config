{ pkgs, ... }: 

pkgs.stdenv.mkDerivation {
		name = "waybar-media-player";
		propagatedBuildInputs = [
			(pkgs.python3.withPackages (pythonPackages: [
				pkgs.python312Packages.pygobject3
			]))	
		];
		buildInputs = [
			pkgs.playerctl
		];
		dontUnpack = true;
		installPhase = "install -Dm755 ${./scripts/mediaplayer.py} $out/bin/mediaplayer";
}

