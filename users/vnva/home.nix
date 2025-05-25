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
    # CLI
    pkgs.home-manager
    pkgs.jq
    pkgs.fzf
    pkgs.tree

    # Apps
    pkgs.neovim
    pkgs.google-chrome
    pkgs.nautilus
    pkgs.telegram-desktop
    pkgs.overskride

    # Fonts
    pkgs.nerd-fonts.zed-mono
    pkgs.inter-nerdfont
  ];

  programs.rofi.enable = true;

  imports = [
    (import ./hyprland.nix { inherit pkgs; })
    (import ./waybar.nix { })
    (import ./ghostty.nix { })
    (import ./shell.nix { })
    (import ./fastfetch.nix { })
    (import ./vscode/main.nix { inherit pkgs; })
    (import ./git.nix { })
  ];
}
