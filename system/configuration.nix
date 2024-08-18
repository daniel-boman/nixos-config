# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      ./modules
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable passwordless sudo
  security.sudo.wheelNeedsPassword = false;
  
	
  #networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Delete old generations
  #nix.settings.auto-optimise-store = true;
  #nix.gc.automatic = true;
  #nix.gc.dates = "daily";
  #nix.gc.options = "--delete-older-than +7";

  # Enable networking
  #networking.networkmanager.enable = true;

  # Set your time zone.
  #time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  #i18n.defaultLocale = "en_GB.UTF-8";

  # Enable hyprland
  #programs.hyprland.enable = true;
  #services.greetd = let session = {
  #	command = "${lib.getExe config.programs.hyprland.package}";
  #	user = "daniel";
  #};
  #in {
  #	enable = true;
  #	settings = {
  #		terminal.vt = 1;
  #		default_session = session;
  #		#initial_session = session;
  #	};
  #};
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };

  # Configure console keymap
  #console.keyMap = "no";

  # Enable CUPS to print documents.
  #services.printing.enable = true;

  # Enable sound with pipewire.
  #hardware.pulseaudio.enable = false;
  #security.rtkit.enable = true;
  
  #services.pipewire = {
  #  enable = true;
  #  alsa.enable = true;
  #  alsa.support32Bit = true;
  #  pulse.enable = true;
  #  # If you want to use JACK applications, uncomment this
#    jack.enable = true;
#
#    # use the example session manager (no others are packaged yet so this is enabled by default,
#    # no need to redefine it in your config for now)
#    #media-session.enable = true;
#  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  #users.users.daniel = {
  #  isNormalUser = true;
  #  description = "daniel";
  #  extraGroups = [ "networkmanager" "wheel" ];
  #  shell = pkgs.zsh;
  #  packages = with pkgs; [
  #  #  thunderbird
  #  ];
  #};

  home-manager = {
  	extraSpecialArgs = {inherit inputs;};
  	users = {
  		"daniel" = import ../home/homepc/home.nix;
  	};
  };

  # Install firefox.
  programs.firefox.enable = true;
  #programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
	micro
	xclip
	yubikey-personalization
  ];

  environment.variables.EDITOR = "micro";
  environment.variables.SUDO_EDITOR = "micro";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  services.udev.packages = [ pkgs.yubikey-personalization ];




  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
