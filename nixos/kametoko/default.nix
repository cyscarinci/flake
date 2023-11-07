{ input, pkgs, lib, vars, ... }:

{

  imports = (import ../modules ) ++ [ ./hardware-configuration.nix ];
  
  modules = {
    network_patch = true;
    hangul_input = true;
    laptop_mode = true;

    sway = false;
    gnome = true;
    xdg = true;

    kitty = true;
    fish = true;
    helix = true;
    emacs = false;    
  };

  environment.systemPackages = with pkgs; [
    firefox-wayland
    thunderbird
    libreoffice-fresh

    texlive.combined.scheme-full
    texlab
    ltex-ls
    tectonic
    zathura
    
  ];
  
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
}
