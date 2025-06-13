{ modulesPath, lib, pkgs, config, ... } @ args:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disko.nix
    ./hardware.nix
    ./network.nix
  ];

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = [
    pkgs.curl
    pkgs.git
  ];

  users.users.root.openssh.authorizedKeys.keys = [
  ];

  sops.secrets.pc-password = { sopsFile = ../../secrets/personal.yaml; key = "pc-password"; };
  users.users.root.hashedPasswordFile = config.sops.secrets.pc-password.path;

  system.stateVersion = "25.05";
}