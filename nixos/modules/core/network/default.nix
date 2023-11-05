{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  options = {
    # modules.network = mkOption {
    #   type = types.bool;
    #   default = false;
    # };
    modules.network_patch = mkOption {
      type = types.bool;
      default = false;
    };
  };
  
  config = mkMerge [(
  # mkIf ( config.modules.network )
  {
    networking.hostName = "${vars.hostName}";
    networking.networkmanager.enable = true; 
  })
  (mkIf ( config.modules.network_patch ) {
    systemd.services.wpa_supplicant.environment.OPENSSL_CONF = pkgs.writeText"openssl.cnf"''
      openssl_conf = openssl_init
      [openssl_init]
      ssl_conf = ssl_sect
      [ssl_sect]
      system_default = system_default_sect
      [system_default_sect]
      Options = UnsafeLegacyRenegotiation
      [system_default_sect]
      CipherString = Default:@SECLEVEL=0
    '';
  })];
}

