{ config, pkgs, ... }: 

{
  imports = [ ./hardware.nix ];

  system.stateVersion = "24.05";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "vnva-laptop";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  time.timeZone = "Asia/Krasnoyarks";

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [ vim curl wget tree ];
}
