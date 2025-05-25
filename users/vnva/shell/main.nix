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
      enable = true;
      plugins = [
        "joshskidmore/zsh-fzf-history-search kind:defer"
        "zdharma-continuum/fast-syntax-highlighting kind:defer"
      ];
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = "$character";
      right_format = "$all";
      add_newline = false;
      character = {
        format = "$symbol  ";
        success_symbol = "[](blue)";
        error_symbol = "[](red)";
      };
      git_status = {
        deleted = " $count ";
        renamed = " $count ";
        staged = " $count ";
        modified = " $count ";
        stashed = " $count ";
        ahead = " \${count} ";
        diverged = " \${ahead_count}  \${behind_count}";
        behind = " \${count} ";
        up_to_date = " $count ";
        conflicted = " $count ";
        untracked = " $count ";
        format = "[$conflicted](red)[$stashed](251)[$untracked]($style)[$staged](green)[$modified](yellow)[$renamed](yellow)[$deleted](red)[$ahead]($style)[$behind]($style)[$diverged]($style)";
      };
      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        symbol = " ";
      };
      package = {
        symbol = " ";
      };
      nodejs = {
        symbol = "[󰋘](green) ";
      };
    };
  };

  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
  };
}
