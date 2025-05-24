{ pkgs, inputs, ... }:

{
  programs.zsh.enable = true;
  users.users.vnva = {
    isNormalUser = true;
    home = "/home/vnva";
    extraGroups = [ "wheel" "docker" ];
    hashedPassword = "$y$j9T$oVP2/K78OhoZHCNsBf7xZ.$nU/LkYll.mJ.jy6zKQ4lxEfRcpYimmMowixES5R3G/4";
    shell = pkgs.zsh;
  };
}
