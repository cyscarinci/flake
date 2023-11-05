{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  options = {
    modules.hyprland = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf ( config.modules.hyprland ) {

    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };

    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "Hyprland";
          user = "${vars.userId}";
        };
        default_session = initial_session;
      };
    };

    programs = {
      dconf.enable = true;
      kdeconnect.enable = true;
      seahorse.enable = true;
    };
    security = {
      polkit.enable = true;
      pam.services.swaylock = { };
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

       
    environment.systemPackages = with pkgs; [
      grim            # Grab Images
      slurp           # Region Selector
      swappy          # Snapshot Editor
      systemd         # System and services
      wl-clipboard    # Clipboard
      wlr-randr       # Monitor Settings
      cliphist


      hyprpaper       # wallpaper utility
      hyprpicker      # color picker
      swww            # wallpaper
      
      viewnior        # imageviewer
      feh
      mpv
      imagemagick
      
      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      gvfs
      gnome.file-roller
      
      gsettings-desktop-schemas
      lxappearance
      gtk3
      gnome3.adwaita-icon-theme
      adwaita-qt
      dracula-theme
      #Kripton
      #Qogir-cursors

      # pamixer
      # light
      playerctl       # media player control
      brightnessctl   # brightness control

      blueberry       # bluetooth manager GUI
      networkmanager  # network manager, including nmtui
      # blueman
      # networkmanagerapplet
      
      xdg-utils       # allow xdg-open to work

      # polkit_gnome    # polkit agent for GNOME
      # gnome.seahorse  # keyring manager GUI
      # gnome.nautilus  # file manager
    ];

    
    home-manager.users.${vars.user} = {

    };
  };
}

