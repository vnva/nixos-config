{ }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "GitHub-Dark-Dimmed";
      cursor-style = "bar";
      window-padding-x = "10,10";
      window-padding-y = "10,10";
      confirm-close-surface = false;
      background-opacity = 0.85;
    };
  };
}
