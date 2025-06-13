{
  description = "vnva's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    disko.url = "github:nix-community/disko";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, disko, home-manager, sops-nix, ... }@inputs: let
    mkSystem = import ./lib/mk-system.nix { inherit nixpkgs inputs home-manager disko sops-nix; };
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

    nixosConfigurations.desktop = mkSystem {
      host = "desktop";
      hostName = "vnva-desktop";
      system = "x86_64-linux";
      rice = "vnva";
    };

    nixosConfigurations.server = mkSystem {
      host = "server";
      hostName = "vnva-server";
      system = "x86_64-linux";
      rice = "vnva-server";
    };
  };
}
