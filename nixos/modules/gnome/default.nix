{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  options = {
    modules.gnome = mkOption {
      type = types.bool;
      default = false;
    };
  };
  
  config = mkIf ( config.modules.gnome ) {
  
    services.xserver = {
      enable = true;
      layout = "kr";
      xkbVariant = "";
      libinput.enable = true;
      desktopManager.gnome.enable = true;
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
        autoLogin = {
          enable = true;
          user = "${vars.user}";
        };
      };
    };
    # Workaround for GNOME autologin
    systemd.services = {
      "getty@tty1".enable = false;
      "autovt@tty1".enable = false;
    };

    # services.gnome.core-utilities.enable = false; 
    environment.gnome.excludePackages = with pkgs; [
      #baobab      # disk usage analyzer
      gnome.cheese      # photo booth
      #gnome.eog         # image viewer
      epiphany    # web browser
      #gedit       # text editor
      gnome.simple-scan # document scanner
      gnome.totem       # video player
      gnome.yelp        # help viewer
      evince      # document viewer
      #gnome.file-roller # archive manager
      gnome.geary       # email client
      gnome.seahorse    # password manager

      gnome.gnome-calculator
      gnome.gnome-calendar 
      gnome.gnome-characters 
      gnome.gnome-clocks 
      gnome-console
      gnome.gnome-contacts
      gnome.gnome-font-viewer 
      gnome.gnome-logs 
      gnome.gnome-maps 
      gnome.gnome-music 
      gnome-photos 
      gnome.gnome-screenshot
      gnome.gnome-system-monitor 
      gnome.gnome-weather 
      gnome.gnome-disk-utility 
      gnome-connections
      gnome.gnome-terminal
      gnome-tour
    ];
  
    home-manager.users.${vars.user} = {
      home.packages = with pkgs; [
        gnomeExtensions.espresso
        gnomeExtensions.just-perfection
        gnomeExtensions.pop-shell
        gnomeExtensions.unite
        gnome.gnome-tweaks
      ];
    };
  };
}
