{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  services.devmon.enable = true;
  services.udisks2.enable = true;
}

