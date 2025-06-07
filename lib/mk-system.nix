{ nixpkgs, home-manager, disko, inputs }:
{ system, host, rice, hostName }:

nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [ 
    { 
      nixpkgs.config.allowUnfree = true; 
      environment.enableAllTerminfo = true;
      networking.hostName = hostName;
    }

    disko.nixosModules.disko
    home-manager.nixosModules.home-manager

    ../hosts/${host}
    ../rices/${rice}
  ];
}
