{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  options = {
    modules.network = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf ( config.modules.network ) {
    
    home-manager.users.${vars.user} = {

    };
  };
}

