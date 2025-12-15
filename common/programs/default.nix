{
  system,
  pkgs,
  lib,
  inputs,
}: let
  inherit (inputs) aagl dms helix niri;
  dmsModule = dms.nixosModules.dankMaterialShell;
  niriModule = niri.nixosModules.niri;
  niriPackage = niri.packages.${system}.niri-unstable;
  xwaylandPackage = niri.packages.${system}.xwayland-satellite-unstable;
in {
  imports = [
    (import ./aagl.nix {inherit aagl;})
    (import ./alacritty.nix {inherit pkgs;})
    (import ./bat.nix {inherit pkgs;})
    (import ./bottom.nix {inherit pkgs;})
    (import ./dms.nix {inherit system pkgs dmsModule;})
    (import ./fish.nix {inherit pkgs;})
    (import ./fzf.nix {inherit pkgs;})
    (import ./git.nix {inherit pkgs;})
    (import ./helix.nix {inherit system pkgs lib helix;})
    (import ./niri.nix {inherit pkgs niriModule niriPackage xwaylandPackage;})
    (import ./tealdeer.nix {inherit pkgs;})
    (import ./yazi.nix {inherit pkgs lib;})
    ./dconf.nix
    ./nh.nix
    ./pay-respects.nix
    ./starship.nix
    ./zoxide.nix
  ];
}
