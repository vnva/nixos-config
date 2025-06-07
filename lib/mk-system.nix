{ nixpkgs, inputs }:
{ system, host, rice }:

nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [ 
    { 
      nixpkgs.config.allowUnfree = true; 
    }

    inputs.home-manager.nixosModules.home-manager 

    ../hosts/${host}
    ../rices/${rice}
  ];
}
