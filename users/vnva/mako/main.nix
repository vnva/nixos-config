{ pkgs, ... }:

{

  services.systembus-notify.enable = true;

  home.packages = [
    pkgs.libnotify
  ];

  services.mako = {
    enable = true;
    settings = {
      font = "Inter Nerd Font 10";
      actions = true;
      anchor = "top-right";
      border-radius = 4;
      border-size = 0;
      width = 300;
      background-color = "#241f31cc";
      border-color = "#ffffffcc";
      padding = 8;

      "mode=do-not-disturb" = {
          invisible = 1;
      };
    };
  };
}