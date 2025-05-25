{ }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake \"$HOME/nixos-config#vnva-laptop\"";
    };
    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.zsh_history";
    };
    antidote = {
      enable = false;
      plugins = [
        #"joshskidmore/zsh-fzf-history-search kind:defer"
        #"zdharma-continuum/fast-syntax-highlighting kind:defer"
      ];
    };
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

  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
  };
}
