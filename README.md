# vnva's nixos configuration

## Usage

Configure disko:

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./hosts/<host>/disko.nix
```
