{ }:
{
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
      core.sharedRepository = true;
    };
  };
}
