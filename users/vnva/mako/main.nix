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

      anchor = "top-right";

      background-color = "#232729cc";

      border-radius = 4;
      border-size = 1;
      border-color = "#ffffffcc";

      width = 300;
      padding = 8;

      actions = true;
      default-timeout = 5000;

      "mode=do-not-disturb" = {
          invisible = 1;
      };
    };
  };
}