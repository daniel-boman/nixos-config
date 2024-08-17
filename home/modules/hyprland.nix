{config, pkgs, inputs, ...}:

{
	home.packages = [
		inputs.hyprland-contrib.packages.${pkgs.system}.grimblast # Screenshots
		
	];
	
	wayland.windowManager.hyprland = {
  		enable = true;
  		systemd.enable = true;
  		xwayland.enable = true;

  		settings = {
  			decoration = {
  				rounding = 10;
  				blur = {
  					enabled = true;
  					size = 2;
  					passes = 2;
  					new_optimizations = true;
  					xray = false;
  				};

  				drop_shadow = true;
  				shadow_range = 4;
  				shadow_render_power = 3;
  				"col.shadow" = "rgba(1a1a1aee)";
	  		};

	  		general = {
	  			gaps_in = 5;
	  			gaps_out = 10;
	  			border_size = 1;
  			   	"col.active_border" = "rgb(8aadf4) rgb(24273A) rgb(24273A) rgb(8aadf4) 45deg";
    			"col.inactive_border" = "rgb(24273A) rgb(24273A) rgb(24273A) rgb(24273A) 45deg";
    			#layout = dwindle
    			allow_tearing = false;
	  		};

	  		animations = {
	  			enabled = true;
	  			bezier = [
	  				"overshot, 0.05, 0.9, 0.1, 1.05"
	  				"smoothOut, 0.36, 0, 0.66, -0.56"
	  				"smoothIn, 0.25, 1, 0.5, 1"
	  			];
				animation = [
    				"windows, 1, 5, overshot, slide"
    				"windowsOut, 1, 4, smoothOut, slide"
    				"windowsMove, 1, 4, default"
    				"border, 1, 10, default"
    				"fade, 1, 10, smoothIn"
    				"fadeDim, 1, 10, smoothIn"
    				"workspaces, 1, 6, default"
    			];
	  		};


			misc = {
				force_default_wallpaper = false;	
			};
			
			"$mod" = "SUPER";
			"$statusbar" = "waybar";
			exec-once = [
				"$statusbar"
				"dbus-update-activation-environment --systemd --all"
				"systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
				"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
				"waybar & hyprpaper"
				"swayidle -w"
				"nwg-look -a"
			];
		
  			bind = [
  				"ALT, SPACE, exec, fuzzel"
  				"$mod, Return, exec, $terminal"
  				"$mod, Q, killactive"
  				"$mod SHIFT, Q, exec, swaylock"
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
				"$mod CTRL SHIFT, left, movetoworkspace, e+1"
				"$mod CTRL SHIFT, right, movetoworkspace, e-1"
				"$mod, V, togglefloating"
				", Print, exec, grimblast copy area"
				"SHIFT, Print, exec, grimblast copysave area"
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
  				"DP-2, highrr, auto-left, 1, transform, 1"
  			];

  			"$terminal" = "alacritty";

  			windowrule = [
  				"float, file_progress"
  				"float, confirm"
  				"float, dialog"
  				"float, download"
  				"float, notification"
  				"float, error"
  				"float, splash"
  				"float, confirmreset"
  				"float, title:Open File"
  				"float, title:branchdialog"
  				"float, pavucontrol-qt"
  				"float, pavucontrol"
  				"fullscreen, wlogout"
  			];

  			windowrulev2 = [
  				"float, title:^(Picture-in-Picture)$"
  				"pin, title:^(Picture-in-Picture)$"
  				"float, class:^(vesktop)$,title:^(Discord Popout)$ "
  				"pin, class:^(vesktop)$,title:^(Discord Popout)$ "
  				"float, class:^(steam)$,title:^(Friends List)$"
  			];
  	};  	
  };
}
