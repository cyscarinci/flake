{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  options = {
    modules.helix = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf ( config.modules.helix ) {
    environment.systemPackages = with pkgs; [
      inputs.helix.packages.${pkgs.system}.default
    ];
    

    home-manager.users.${vars.user} = {
      home.file.".config/helix".source = ./config;
    };
  };
}

