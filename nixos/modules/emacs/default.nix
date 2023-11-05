{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  options = {
    modules.emacs = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf ( config.modules.kitty ) {
    environment.systemPackages = with pkgs; [
      emacs29
    ];

    home-manager.users.${vars.user} = {
      programs.emacs = {
        enable = true;
        package = pkgs.emacs29;
      };
      services.emacs = {
        enable = true;
        package = pkgs.emacs29;
        client.enable = true;
        startWithUserSession = "graphical";
      };
      home.file.".emacs.d/early-init.el".source = ./config/early-init.el;
      home.file.".emacs.d/init.el".source = ./config/init.el;
    };
  };
}

