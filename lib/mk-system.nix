{ nixpkgs, inputs }:

name: { system, user }:

let
  hostConfig = ../hosts/${name}/main.nix;
  userConfig = ../users/${user}/main.nix;
  homeManagerConfig = ../users/${user}/home.nix;
in nixpkgs.lib.nixosSystem rec {
  inherit system;

  modules = [ 
    { nixpkgs.config.allowUnfree = true; } 

    hostConfig 
    userConfig

    inputs.home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import homeManagerConfig { inputs = inputs; };
    }
  ];
}
