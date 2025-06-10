{ nixpkgs, home-manager, disko, sops-nix, inputs }:
{ system, host, rice, hostName }:

nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [
    # Default nixos settings
    { 
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nixpkgs.config.allowUnfree = true; 
      environment.enableAllTerminfo = true;
      networking.hostName = hostName;
    }

    # Define nixos modules
    sops-nix.nixosModules.sops
    disko.nixosModules.disko
    home-manager.nixosModules.home-manager

    # Default home manager modules
    {
      home-manager.sharedModules = [
        sops-nix.homeManagerModules.sops
      ];
    }

    # Sops config
    {
      sops.age.keyFile = "/home/vnva/.config/sops/age/keys.txt"; # TODO: move username to variable
      sops.secrets.pc-password = { sopsFile = ../secrets/personal.yaml; key = "pc-password"; }; 
    }

    # Selected configs
    ../hosts/${host}
    ../rices/${rice}
  ];
}
