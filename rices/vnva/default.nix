{ pkgs, inputs, lib, ... }:

{
  security.sudo.wheelNeedsPassword = false;

  security.polkit.enable = true;
  security.pam.services.hyprland.enableGnomeKeyring = true;
  
  # ========= HYPRLAND GTK FIXES ========
  # https://github.com/matthewpi/nixos-config/blob/0965250feda8fa3d386cda3605cf6974b1320eb6/modules/hyprland/default.nix#L84
  
  # Enable gvfs
  services.gvfs.enable = lib.mkDefault true;

  # Enable glib-networking.
  services.gnome.glib-networking.enable = lib.mkDefault true;

  # Fixes issues with XDG portal definitions not being detected.
  # ref; https://nix-community.github.io/home-manager/options.xhtml#opt-xdg.portal.enable
  environment.pathsToLink = ["/share/applications" "/share/xdg-desktop-portal"];

  services.graphical-desktop.enable = lib.mkDefault false;

  # ========= END HYPRLAND GTK FIXES ========

  users.users.vnva = {
    isNormalUser = true;
    home = "/home/vnva";
    extraGroups = [
      "wheel"
      "docker"
    ];
    hashedPassword = "$y$j9T$oVP2/K78OhoZHCNsBf7xZ.$nU/LkYll.mJ.jy6zKQ4lxEfRcpYimmMowixES5R3G/4";
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.vnva = import ./home.nix { inherit inputs; };
}
