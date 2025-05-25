{ pkgs, ... }:
{
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.packages = [
    pkgs.uwsm

    # Hyprland
    pkgs.hyprcursor
    pkgs.rose-pine-hyprcursor

    # GTK
    pkgs.gnome-themes-extra
    pkgs.rose-pine-cursor
    pkgs.dconf
    pkgs.glib

    # Clipboard
    pkgs.wl-clipboard

    # Screenshots
    pkgs.slurp
    pkgs.grim
    pkgs.swappy
  ];

  xdg = {
    enable = true;
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config = {
        preffered = {
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
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  home.file.".config/shared.conf" = {
    source = ./shared.conf;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    sourceFirst = true;
    settings = {
      "source" = [ "~/.config/shared.conf" ];
    };
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
