# https://github.com/elitak/nixos-infect/blob/5ef3f953d32ab92405b280615718e0b80da2ebe6/nixos-infect#L150

{ lib, config, ... }: 

{
  networking = {
    dhcpcd.enable = false;
  };
}