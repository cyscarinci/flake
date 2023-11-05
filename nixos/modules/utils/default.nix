{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  environment.systemPackages = with pkgs; [

    coreutils         # GNU Utilities
    pciutils          # Manage PCI
    usbutils          # Manage USB
    
    killall           # Process Killer

    fmt
    
    btop              # Resource Manager
    bottom
    tldr              # Helper
    neofetch          # System Info
    nix-tree          # Browse Nix Store
    wget              # Retriever

    bat               # cat
    sd                # sed
    fd                # find
    lsd               # ls
    eza               # ls
    delta             # diff
    ripgrep           # grep
    kondo             # cleaning tool
    zoxide            # cd


    unrar             # Rar Files
    gnutar            # Tar Files
    p7zip             # Zip Files
    unzip             # Zip Files
    zip               # Zip Files
  ];
}
