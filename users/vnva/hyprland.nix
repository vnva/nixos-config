{ pkgs, ... }:
{
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
        pkgs.xdg-desktop-portal-wlr
      ];
      config = {
        preferred = {
          default = [ "hyprland" ];
          "org.freedesktop.impl.portal.Settings" = "gtk";
        };
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
    };
  };

  home.file.".config/hyprland-default.conf" = {
    source = ./hyprland-default.conf;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    sourceFirst = true;
    settings = {
      "source" = [ "~/.config/hyprland-default.conf" ];
    };
  };

  home.file."wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "false";
      preload = [ "~/wallpapers/nix-gear.png" ];
      wallpaper = [ ",~/wallpapers/nix-gear.png" ];
    };
  };
}
