{
  imports = [ ./disko.nix ];

  system.stateVersion = "25.05";

  time.timeZone = "Asia/Krasnoyarsk";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=0
  '';

  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

  services = {
    openssh.enable = true;
  };

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
