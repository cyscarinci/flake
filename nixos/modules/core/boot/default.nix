{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.configurationLimit = 3;
    
    #kernelPackages = pkgs.linuxPackages_latest;
    #kernelParams = [ "quiet" "splash" ];
    #plymouth.enable = true;
    #consoleLogLevel = 0;
    #initrd.verbose = false;
    # initrd.kernelModules = [ “i915” ];
  };
}
