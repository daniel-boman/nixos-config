{ config, pkgs, inputs, lib, ...}:

{
	programs.waybar = {
		enable = false;
		systemd.enable = false;

		settings = {

			mainBar = {
				layer =  "top";
			    position =  "top";
			    mod = "dock";
			    passthrough = false;
			    "gtk-layer-shell" = true;
			    height = 0;
			    "modules-left" =  [
			        "hyprland/workspaces"
			    ];
			    "modules-center" =  [ "hyprland/window" "custom/spotify" ];
			    "modules-right" =  [
			        "tray"
			        "custom/updates"
			        "pulseaudio"
			        "pulseaudio#microphone"
			        "clock"
			        "cpu"
			        "memory"
					"network"
			    ];
			
			    "hyprland/window" =  {
			        format =  "{}";
			    };
			    "hyprland/workspaces" =  {
			        disable-scroll =  true;
			        all-outputs =  true;
			        on-click =  "activate";
			    };
			    "hyprland/language" = {
			        format =  "{}";
			        format-en =  "US";
			    };
			   "custom/weather" = {
			        tooltip  =  true;
			        format  =  "{}";
			        interval  =  30;
			        exec  =  "~/.config/waybar/scripts/waybar-wttr.py";
			        return-type  =  "json";
			    };
			    "custom/spotify" = {
			    	exec = "${pkgs.waybar-media-player}/bin/mediaplayer --player spotify";
			    	format = "{} ";
			    	return-type = "json";
			    	onclick = "playerctl play-pause";
			    	on-scroll-up = "playerctl next";
			    	on-scroll-down = "playerctl previous";
			    };
			    tray = {
			       	icon-size =  16;
			        spacing =  10;
			    };
      			clock = {
      			  format-alt = "{:%Y-%m-%d}";
      			  tooltip-format = "{:%Y-%m-%d | %H:%M}";
      			};
      			cpu = {
      			  format = "{usage}% ";
      			  tooltip = true; 
      			};
      			memory = { format = "{}% "; };
      			network = {
      			  interval = 1;
      			  format-alt = "{ipaddr}/{cidr}";
      			  format-disconnected = "Disconnected ⚠";
      			  format-ethernet = "{ipaddr}/{cidr} up: {bandwidthUpBytes} down: {bandwidthDownBytes}";
      			  format-linked = "{ifname} (No IP) ";
      			  format-wifi = "{essid} ({signalStrength}%) ";
      			};
			    pulseaudio = {
			        format =  "{icon} {volume}%";
			        tooltip =  false;
			        format-muted =  " Muted";
			        on-click =  "pavucontrol";
			        on-scroll-up =  "pamixer -i 5";
			        on-scroll-down =  "pamixer -d 5";
			        scroll-step =  5;
			        format-icons =  {
			            headphone =  "";
			            hands-free =  "";
			            headset =  "";
			            phone =  "";
			            portable =  "";
			            car =  "";
			            default =  [""  "" ""];
			        };
			    };
			    "pulseaudio#microphone" = {
			        format =  "{format_source}";
			        format-source =  "🎙{volume}%";
			        format-source-muted =  "🎙Muted";
			        on-click =  "pamixer --default-source -t";
			        on-scroll-up =  "pamixer --default-source -i 5";
			        on-scroll-down =  "pamixer --default-source -d 5";
			        scroll-step =  5;
			    };
	
			};
		};
	   
	    style = ''
* {
  border: none;
  border-radius: 0;
  font-family:
    Jetbrains Mono Nerd Font,
    monospace;
  font-weight: bold;
  font-size: 14px;
  min-height: 0;
}

window#waybar {
  background: rgba(21, 18, 27, 0);
  color: #cdd6f4;
}

tooltip {
  background: #1e1e2e;
  border-radius: 10px;
  border-width: 2px;
  border-style: solid;
  border-color: #11111b;
}

#workspaces button {
  padding: 5px;
  color: #313244;
  margin-right: 5px;
}

#workspaces button.active {
  color: #a6adc8;
}

#workspaces button.focused {
  color: #a6adc8;
  background: #eba0ac;
  border-radius: 10px;
}

#workspaces button.urgent {
  color: #11111b;
  background: #a6e3a1;
  border-radius: 10px;
}

#workspaces button:hover {
  background: #11111b;
  color: #cdd6f4;
  border-radius: 10px;
}

#language,
#custom-updates,
#custom-caffeine,
#custom-weather,
#window,
#clock,
#battery,
#pulseaudio,
#workspaces,
#tray,
#memory,
#network,
#cpu,
#backlight {
  background: #1e1e2e;
  padding: 0px 10px;
  margin: 3px 0px;
  margin-top: 10px;
  border: 1px solid #181825;
}

#tray {
  border-radius: 10px;
  margin-right: 10px;
}

#workspaces {
  background: #1e1e2e;
  border-radius: 10px;
  margin-left: 10px;
  padding-right: 0px;
  padding-left: 5px;
}

#custom-caffeine {
  color: #89dceb;
  border-radius: 10px 0px 0px 10px;
  border-right: 0px;
  margin-left: 10px;
}

#custom-language {
  color: #f38ba8;
  border-left: 0px;
  border-right: 0px;
}

#custom-updates {
  color: #f5c2e7;
  border-radius: 10px 0px 0px 10px;
  border-left: 0px;
  border-right: 0px;
}

#window {
  border-radius: 10px;
  margin-left: 60px;
  margin-right: 60px;
}

#custom-spotify {
  border-radius: 10px;
  margin-left: 60px;
  margin-right: 60px;	
}

#clock {
  color: #fab387;
  border-radius: 10px 0px 0px 10px;
  margin-left: 5px;
  border-right: 0px;
}

#cpu {
  color: #fab387;
  border-radius: 10px 0px 0px 10px;
  margin-left: 6px;
  border-right: 0px;
}


#memory {
  color: #fab387;
  border-radius: 10px 0px 0px 10px;
  margin-left: 6px;
  border-right: 0px;
}


#network {
  background: #1e1e2e;
  border-radius: 10px 0px 0px 10px;
  margin-left: 6px;
  border-right: 0px;
}

#pulseaudio {
  color: #89b4fa;
  border-left: 0px;
  border-right: 0px;
}

#pulseaudio.microphone {
  color: #cba6f7;
  border-radius: 0px 10px 10px 0px;
  border-left: 0px;
  border-right: 0px;
  margin-right: 5px;
}

#battery {
  color: #a6e3a1;
  border-radius: 0 10px 10px 0;
  margin-right: 10px;
  border-left: 0px;
}

#custom-weather {
  border-radius: 0px 10px 10px 0px;
  border-right: 0px;
  margin-left: 0px;
}

	    '';
	};
}
