{ }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ./style.css;
    settings = [
      {
        height = 24;
        spacing = 8;
        margin-top = 10;
        margin-left = 10;
        margin-right = 10;

        modules-left = [
          "hyprland/workspaces"
          "tray"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "hyprland/language"
          "clock"
          "clock#london"
          "wireplumber"
          "custom/mako"
          "backlight"
          "battery"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
        };

        "hyprland/window" = {
          max-length = 60;
          separate-outputs = true;
        };

        "hyprland/language" = {
          format-en = "en";
          format-ru = "ru";
        };

        "clock" = {
          format = "   {:%H:%M / %d.%m.%Y}";
          format-alt = "   {:%H:%M / %a %b %d}";
          timezone = "Asia/Krasnoyarsk";
          tooltip = false;
        };

        "clock#london" = {
          format = "󰌃   {:%H:%M}";
          timezone = "Europe/London";
          tooltip = false;
        };

        "battery" = {
          states = {
            warning = 20;
            critical = 10;
          };
          format = "{icon}   {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          max-length = 25;
        };

        "wireplumber" = {
          format = "{icon}   {volume}%";
          format-muted = " ";
          on-click = "pwvucontrol";
          format-icons = [
            ""
            ""
            ""
          ];
          tooltip = false;
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{icon}   {percent}%";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          tooltip = false;
          on-click = "brightnessctl set 1-";
          on-click-middle = "brightnessctl set 1-";
          on-click-right = "brightnessctl set 1-";
          on-update = "";
          on-scroll-up = "brightnessctl set 1+";
          on-scroll-down = "brightnessctl set 1-";
          smooth-scrolling-threshold = 1;
        };

        "custom/mako" = {
          format = "{text} ";
          exec = "${./scripts/mako-status.sh}";
          on-click = "makoctl mode -t do-not-disturb";
          return-type = "json";
        };
      }
    ];
  };
}
