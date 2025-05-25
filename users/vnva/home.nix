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

  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.home-manager
    pkgs.jq
    pkgs.fzf
    pkgs.tree
    pkgs.google-chrome
    pkgs.neovim
    pkgs.uwsm
    pkgs.hyprcursor
    pkgs.rose-pine-hyprcursor
    pkgs.rose-pine-cursor
    pkgs.nautilus
    pkgs.telegram-desktop
    pkgs.dconf
    pkgs.glib
    pkgs.overskride
    pkgs.nerd-fonts.zed-mono
  ];

  home.file = { };

  programs.git = {
    enable = true;
    userName = "Vyacheslav Ananev";
    userEmail = "vnva.dev@gmail.com";
    aliases = {
      st = "status -sb";
      co = "checkout";
      br = "branch";
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
    extraConfig = {
      color.ui = true;
      github.user = "vnva";
      push.default = "current";
      init.defaultBranch = "main";
      core.untrackedCache = true;
    };
  };

  programs.rofi.enable = true;

  imports = [
    (import ./hyprland.nix { inherit pkgs; })
    (import ./waybar.nix { })
    (import ./ghostty.nix { })
    (import ./shell.nix { })
    (import ./fastfetch.nix { })
    (import ./vscode/main.nix { inherit pkgs; })
  ];
}
