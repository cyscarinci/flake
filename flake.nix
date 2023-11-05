{
  description = "NixOS and MacOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    helix.url = "github:helix-editor/helix/master";
  };
  
  outputs = inputs@{ self, nixpkgs, nixos-hardware, home-manager, darwin, hyprland, helix, ... }:
  {
    nixosConfigurations = ( import ./nixos { inherit inputs; } );
#    homeConfigurations = ( import ./home { inherit inputs; } );
#    darwinConfigurations = ( import ./darwin { inherit inputs; } );
  };
}
