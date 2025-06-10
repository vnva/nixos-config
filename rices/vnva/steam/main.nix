# https://nixos.wiki/wiki/Steam
{ pkgs, ... }:

{
    home.packages = [
        pkgs.steam
        pkgs.atlauncher
        pkgs.lunar-client
        pkgs.prismlauncher
        # pkgs.steam-original
        # pkgs.steam-unwrapped
        # pkgs.steam-run
    ];
}