{ config, pkgs, ... }:

{
  imports = [ ./hardware.nix ];

  system.stateVersion = "25.05";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "vnva-laptop";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  time.timeZone = "Asia/Krasnoyarks";

  services.openssh.enable = true;

  programs.nix-ld.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
    tree
  ];
}
