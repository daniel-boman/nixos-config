{config, pkgs, inputs, ...}:

{
	services.mako = {
		enable = true;

		sort = "-time";
		layer = "overlay";
		width = 300;
		height = 110;
		borderSize = 2;
		borderRadius = 15;
		icons = true;
		maxIconSize = 4;
		defaultTimeout = 5000;
		ignoreTimeout = true;
		font = "monospace 14";

		backgroundColor = "#24273a";
		textColor = "#cad3f5";
		borderColor = "#8aadf4";
		progressColor = "over #363a4f";

		extraConfig = ''
			[urgency=high]
			border-color=#f5a97f
			[category=mpd]
			default-timeout=2000
			group-by=category
		'';
	};
}
