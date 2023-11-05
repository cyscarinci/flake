{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  options = {
    modules.kitty = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf ( config.modules.kitty ) {
    environment.systemPackages = with pkgs; [
      kitty
    ];
    
    home-manager.users.${vars.user} = {
      home.file.".config/kitty".source = ./config;
    };
  };
}

