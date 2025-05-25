{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    userSettings = builtins.fromJSON (builtins.readFile ./user-settings.json);
    extensions = [
      # Nix
      pkgs.vscode-extensions.bbenoist.nix
      pkgs.vscode-extensions.brettm12345.nixfmt-vscode

      # Prettier / ESLint
      pkgs.vscode-extensions.esbenp.prettier-vscode
      pkgs.vscode-extensions.dbaeumer.vscode-eslint

      # AI
      pkgs.vscode-extensions.supermaven.supermaven

      # GitHub.github-vscode-theme
      pkgs.vscode-extensions.github.github-vscode-theme
    ];
  };
}
