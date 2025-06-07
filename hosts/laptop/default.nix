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

  time.timeZone = "Asia/Krasnoyarsk";

  services = {
    ntp.enable = true;
    openssh.enable = true;
    blueman.enable = true;
    tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = 60;
        STOP_CHARGE_THRESH_BAT0 = 75;
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };
  };

  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
    tree
  ];
}
