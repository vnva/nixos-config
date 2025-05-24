{ inputs, ... }:
{ config, lib, pkgs, ... }:

{
  home.stateVersion = "24.11";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = [
    pkgs.home-manager
    pkgs.jq
    pkgs.fzf
    pkgs.tree
    pkgs.google-chrome
  ];

  home.file = {};

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

  programs.zsh = {
    enable = true;
    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.zsh_history";
    };
    antidote = {
      enable = true;
      plugins = [
        "joshskidmore/zsh-fzf-history-search"
	"zdharma-continuum/fast-syntax-highlighting"
      ];
    };
  };

  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      os = {
        disabled = false;
	symbols = {
	  NixOS = " ";
	};
      };
    };
  };

  programs.neovim = {
    enable = true;
  };
}
