{ inputs, ... }:
{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file."wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };

  fonts.fontconfig.enable = true;

  home.packages = [
    # Base
    pkgs.xdg-utils

    # CLI
    pkgs.home-manager
    pkgs.jq
    pkgs.fzf
    pkgs.tree
    pkgs.unzip

    # Apps
    pkgs.neovim
    pkgs.google-chrome
    # pkgs.yandex-music
    pkgs.nautilus
    pkgs.telegram-desktop
    pkgs.overskride
    pkgs.pwvucontrol
    pkgs.mpv

    # Fonts
    pkgs.nerd-fonts.zed-mono
    pkgs.inter-nerdfont
    pkgs.noto-fonts-emoji-blob-bin

    # Dev
    pkgs.awscli2
    pkgs.nodejs_22
  ];

  services.polkit-gnome.enable = true;
  services.gnome-keyring.enable = true;

  imports = [
    (import ./hyprland/main.nix { inherit pkgs; })
    (import ./waybar/main.nix { })
    (import ./ghostty/main.nix { })
    (import ./shell/main.nix { })
    (import ./fastfetch/main.nix { })
    (import ./vscode/main.nix { inherit pkgs; })
    (import ./rofi/main.nix { inherit pkgs; })
    (import ./git/main.nix { })
    (import ./steam/main.nix { inherit pkgs; })
    (import ./htop/main.nix { inherit config; })
    (import ./mako/main.nix { inherit pkgs; })
    (import ./xdg/main.nix { })
  ];
}
