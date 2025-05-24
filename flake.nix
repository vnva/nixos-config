{
  description = "vnva's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: let
    mkSystem = import ./lib/mk-system.nix { inherit nixpkgs inputs; };
  in {
    nixosConfigurations.vnva-laptop = mkSystem "vnva-laptop" {
      system = "x86_64-linux";
      user = "vnva";
    };
  };
}
