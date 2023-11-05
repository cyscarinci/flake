{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  options = {
    modules.fish = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf ( config.modules.fish ) {
    programs.fish = {
      enable = true;
    };
    
    home-manager.users.${vars.user} = {
      home.file.".config/fish".source = ./config;
    };
  };
}

