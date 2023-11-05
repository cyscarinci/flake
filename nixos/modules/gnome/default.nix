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
    
    home-manager.users.${vars.user} = {
      home.packages = with pkgs; [
        gnomeExtensions.espresso
        gnomeExtensions.just-perfection
        gnomeExtensions.pop-shell
        gnomeExtensions.unite
        gnome.gnome-tweaks
      ];

      gtk = {
        enable = true;
        cursorTheme = {
          package = pkgs.vanilla-dmz;
          name = "Vanilla-DMZ";
          size = 24;
        };

        theme = {
          # package = pkgs.adw-gtk3;
          # name = "adw-gtk3";
          package = pkgs.pop-gtk-theme;
          name = "pop-gtk-theme";
          # package = pkgs.libsForQt5.breeze-gtk;
          # name = "Breeze";
        };
        iconTheme = {
          # package = pkgs.gnome.adwaita-icon-theme;
          # name = "Adwaita";
          package = pkgs.pop-icon-theme;
          name = "pop-icon-theme";
          # package = pkgs.libsForQt5.breeze-icons;
          # name = "Breeze";
        };
        gtk3.extraConfig = {
          gtk-application-prefer-dark-theme=1;
        };
        gtk4.extraConfig = {
          gtk-application-prefer-dark-theme=1;
        };
      };
    };
  };
}
