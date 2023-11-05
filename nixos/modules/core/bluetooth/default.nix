{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}

