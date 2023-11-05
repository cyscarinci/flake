{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  services = {
    printing.enable = true;
    avahi = { enable = true; nssmdns = true; openFirewall = true; };
  };
}

