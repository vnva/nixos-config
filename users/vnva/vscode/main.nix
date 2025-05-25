{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default.userSettings = builtins.fromJSON (builtins.readFile ./user-settings.json);
    profiles.default.extensions = [
      # Nix
      pkgs.vscode-extensions.bbenoist.nix
      pkgs.vscode-extensions.brettm12345.nixfmt-vscode

      # Prettier / ESLint
      pkgs.vscode-extensions.esbenp.prettier-vscode
      pkgs.vscode-extensions.dbaeumer.vscode-eslint

      # AI
      pkgs.vscode-extensions.supermaven.supermaven

      # UI
      pkgs.vscode-extensions.github.github-vscode-theme
    ];
  };
}
