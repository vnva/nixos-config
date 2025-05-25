# https://nixos.wiki/wiki/Steam
{ pkgs, ... }:

{
    home.packages = [
        pkgs.steam
        # pkgs.steam-original
        # pkgs.steam-unwrapped
        # pkgs.steam-run
    ];
}