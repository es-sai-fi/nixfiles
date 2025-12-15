{
  system,
  pkgs,
  lib,
  inputs,
}: let
  inherit (inputs) aagl dms helix;
in {
  imports = [
    (import ./aagl.nix {inherit aagl;})
    (import ./alacritty.nix {inherit pkgs;})
    (import ./bat.nix {inherit pkgs;})
    (import ./bottom.nix {inherit pkgs;})
    (import ./dms.nix {inherit system pkgs dms;})
    (import ./fish.nix {inherit pkgs;})
    (import ./fzf.nix {inherit pkgs;})
    (import ./git.nix {inherit pkgs;})
    (import ./helix.nix {inherit system pkgs lib helix;})
    (import ./niri.nix {inherit pkgs;})
    (import ./tealdeer.nix {inherit pkgs;})
    (import ./yazi.nix {inherit pkgs lib;})
    ./dconf.nix
    ./nh.nix
    ./pay-respects.nix
    ./starship.nix
    ./zoxide.nix
  ];
}
