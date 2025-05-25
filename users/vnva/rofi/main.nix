{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = ./theme.rasi;
    plugins = [ pkgs.rofi-emoji pkgs.rofi-calc pkgs.rofi-file-browser ];
    font = "Inter Nerd Font 11";
    extraConfig = {
        combi-modes = [ "window" "drun" "filebrowser" "calc" ];
        modes = [ "window" "drun" "filebrowser" "calc" ];
        terminal = "ghostty";

        sidebar-mode = true;

        # filebrowser = {
        #     sorting-method = "name";
        #     directories-first = true;
        # };

        display-drun = "   Apps";
        display-run = "   Run";
        display-filebrowser = "   Files";
        display-window = "   Windows";
        display-calc = "  Calc";
        display-emoji = "󰞅  Emoji";
        drun-display-format = "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
        window-format = "{t}";
    };
  };
}