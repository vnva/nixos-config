{
  description = "vnva's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    disko.url = "github:nix-community/disko";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
  };

  outputs = { self, nixpkgs, disko, home-manager, ... }@inputs: let
    mkSystem = import ./lib/mk-system.nix { inherit nixpkgs inputs home-manager disko; };
  in
  {
    nixosConfigurations.laptop = mkSystem {
      host = "laptop";
      hostName = "vnva-laptop";
      system = "x86_64-linux";
      rice = "vnva";
    };

    nixosConfigurations.vm = mkSystem {
      host = "vm";
      hostName = "vnva-vm";
      system = "x86_64-linux";
      rice = "vnva";
    };
  };
}
