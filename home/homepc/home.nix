{ config, pkgs, inputs, ... }:

{

  imports = [
  	../modules
  ];  
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "daniel";
  home.homeDirectory = "/home/daniel";
  
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/daniel/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "micro";
    SUDO_EDITOR = "micro";
    TERMINAL = "alacritty";
    
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.btop = {
  	enable = true;
  };

  programs.fuzzel = {
  	enable = true;

	settings = {
		colors = {
			background = "24273add";
			text = "cad3f5ff";
			match = "8aadf4ff";
			selection = "5b6078ff";
			selection-match = "8aadf4ff";
			selection-text = "cad3f5ff";
			border = "b7bdf8ff";
		};	
	};
  };

  programs.alacritty = {
  	enable = true;
  	settings = {
  		terminal = {
  			osc52 = "CopyPaste";
  		};
  	};
  };

  programs.zsh = {
  	enable = true;
  	autosuggestion.enable = true;
  	syntaxHighlighting.enable = true;
  	shellAliases = {
  		rebuild = "sudo nixos-rebuild switch --flake ~/.nixos/#default";	
  	};

  	profileExtra = ''
  		unset SSH_AGENT_PID
  		export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  		export GPG_TTY=$(tty)
  		gpg-connect-agent updatestartuptty /bye >/dev/null
  	'';

  	oh-my-zsh = {
  		enable = true;
  		plugins = [
  			"git"
  			"history"
  			"history-substring-search"
  			"golang"
  			"rust"
  			"docker"
  			#"ssh-agent"	
  		];
  		theme = "af-magic";
  	};
  };

  programs.git = {
  	enable = true;

  	userEmail = "daniel.boman@pm.me";
  	userName = "Daniel Boman";

  	signing = {
  		signByDefault = true;
  		key = "C30B 055A 68C6 D657 1EF0  6133 5928 A043 6DB7 7DA6";	
  	};
  };



  programs.gpg = {
  	enable = true;

  	publicKeys = [
  		{
  			source = ./yubikey-c.gpg;
  			trust = 5;
  		}	
  	];
  };  
}
