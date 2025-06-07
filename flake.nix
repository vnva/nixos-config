{
  description = "vnva's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    disko.url = "github:nix-community/disko";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: let
    mkSystem = import ./lib/mk-system.nix { inherit nixpkgs inputs; };
  in
  {
    nixosConfigurations.laptop = mkSystem {
      host = "laptop";
      system = "x86_64-linux";
      rice = "vnva";
    };
  };
}
