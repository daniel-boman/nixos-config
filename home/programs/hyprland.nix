{config, pkgs, inputs, ...}:

{
	home.packages = [
		pkgs.nwg-look	
	];
 	wayland.windowManager.hyprland = {
  		enable = true;
  		systemd.enable = true;
  		xwayland.enable = true;

  		settings = {
  			decoration = {
  				shadow_offset = "0 5";
  				"col.shadow" = "rgba(00000099)";
	  		};

			"$mod" = "SUPER";
		
  			bind = [
  				"ALT, SPACE, exec, fuzzel"
  				"$mod, Return, exec, $terminal"
  				"$mod, Q, killactive"
  				"$mod, M, fullscreen, 1"
  				"$mod, F, fullscreen"
  				"$mod, up, movefocus, u"
  				"$mod, left, movefocus, l"
  				"$mod, right, movefocus, r"
  				"$mod, down, movefocus, d"
  				"$mod ALT, left, resizeactive, -160 0"
  				"$mod ALT, right, resizeactive, 160 0"
  				"$mod ALT, up, resizeactive, 0 -160"
  				"$mod ALT, down, resizeactive, 0 160"
				"$mod SHIFT, left, movewindow, l"
				"$mod SHIFT, right, movewindow, r"
				"$mod SHIFT, up, movewindow, u"
				"$mod SHIFT, down, movewindow, d"
				"$mod CTRL, left, workspace, e+1"
				"$mod CTRL, right, workspace, e-1"
				"$mod, V, togglefloating"
  			];

  			bindm = [
  				"$mod, mouse:272, movewindow"
  				"$mod, mouse:273, resizewindow"	
  			];

  			input = {
  				kb_layout = "no";	
  			};

  			monitor = [
  				"DP-1, preferred, auto, 1"
  				"DP-2, preferred, auto-left, 1, transform, 1"
  			];

  			"$terminal" = "alacritty";
  	};  	
  };
}
