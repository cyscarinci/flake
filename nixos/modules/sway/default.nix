{ config, inputs, pkgs, lib, vars, ... }:
with lib;
let
  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };
  configure-gtk = pkgs.writeTextFile {
    name = "configure-gtk";
    destination = "/bin/configure-gtk";
    executable = true;
    text = let
      schema = pkgs.gsettings-desktop-schemas;
      datadir = "${schema}/share/gsettings-schemas/${schema.name}";
    in ''
      export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
      gnome_schema=org.gnome.desktop.interface
      gsettings set $gnome_schema gtk-theme 'Dracula'
    '';
  };
in
{
  options = {
    modules.sway = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf ( config.modules.sway ) {

    hardware.opengl = {
      enable = true;
    };

    users.users.${vars.user}.extraGroups = [ "video" ];
    programs.light.enable = true;

    services.greetd = {
      enable = true;
      settings = {
        default_session.command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time \
          --asterisks \
          --user-menu \
          --cmd sway
        '';
      };
    };

    environment.etc."greetd/environments".text = ''
      sway
    '';

    
    security.polkit.enable = true;
    security.pam.services.swaylock = {};
    security.pam.loginLimits = [
      { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
    ];
    
    systemd.user.services.kanshi = {
      description = "kanshi daemon";
      serviceConfig = {
        Type = "simple";
        ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
      };
    };
    
    home-manager.users.${vars.user} = {
      wayland.windowManager.sway = {
        enable = true;
        config = rec {
          modifier = "Mod4";
          terminal = "kitty"; 
          startup = [ {command = "firefox";} ];
        };
        xwayland = true;
      };

      home.pointerCursor = {
        name = "Adwaita";
        package = pkgs.gnome.adwaita-icon-theme;
        size = 24;
        x11 = {
          enable = true;
          defaultCursor = "Adwaita";
        };
      };
    };
  
  };
}

