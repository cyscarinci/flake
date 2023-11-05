{ inputs, ... }:
let
  system = "x86_64-linux";
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = inputs.nixpkgs.lib;
  vars = {
    user = "caco";
    userName = "Carlos Scarinci";
    homeDirectory = "/home/caco";
    userEmail = "cyscarinci@gmail.com";
    extraEmail = "cscarinci@dgist.ac.kr";
        
    hostName = "kametoko";
    timeZone = "Asia/Seoul";
    defaultLocale = "en_US";
    extraLocale = "ko_KR";
    
    term = "kitty";
    shell = "fish";
    editor = "hx";
    browser = "firefox";
  };
in
{
  kametoko = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs pkgs lib vars;
    };
    modules = [
      inputs.nixos-hardware.nixosModules.dell-xps-13-9310
      inputs.home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
      ./kametoko
    ];
  };
  
}

