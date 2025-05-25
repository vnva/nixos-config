{
  description = "vnva's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      mkSystem = import ./lib/mk-system.nix { inherit nixpkgs inputs; };
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      nixosConfigurations.vnva-laptop = mkSystem "vnva-laptop" {
        system = "x86_64-linux";
        user = "vnva";
      };
    };
}
