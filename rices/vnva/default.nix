{ pkgs, inputs, lib, config, ... }:


{
  sops.secrets.pc-password = { sopsFile = ../../secrets/personal.yaml; key = "pc-password"; };

  security.sudo.wheelNeedsPassword = true;

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
    extraGroups = [ "wheel" "docker"];
    hashedPasswordFile = config.sops.secrets.pc-password.path;
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.vnva = import ./home.nix { inherit inputs; };

  programs.steam.gamescopeSession.enable = true;
  programs.gamescope = { enable = true; capSysNice = true; };
  programs.gamemode = {
    enable = true;
    settings = {
      general = { renice = 10; };
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
      };
    };
  };
}
