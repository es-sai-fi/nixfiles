{
  system,
  pkgs,
  lib,
  inputs,
}: let
  inherit (inputs) aagl dms helix niri;
  dmsModule = dms.nixosModules.dankMaterialShell;
  greeterModule = dms.nixosModules.greeter;
  niriModule = niri.nixosModules.niri;
  niriOverlay = niri.overlays.niri;
  niriPackage = niri.packages.${system}.niri-unstable;
  xwaylandPackage = niri.packages.${system}.xwayland-satellite-unstable;
in {
  imports = [
    (import ./aagl.nix {inherit aagl;})
    (import ./alacritty.nix {inherit pkgs;})
    (import ./bat.nix {inherit pkgs;})
    (import ./bottom.nix {inherit pkgs;})
    (import ./dms.nix {inherit system pkgs lib dmsModule greeterModule;})
    (import ./fish.nix {inherit pkgs;})
    (import ./firefox.nix {inherit pkgs;})
    (import ./fzf.nix {inherit pkgs;})
    (import ./git.nix {inherit pkgs;})
    (import ./helix.nix {inherit system pkgs lib helix;})
    (import ./niri.nix {inherit pkgs niriModule niriOverlay niriPackage xwaylandPackage;})
    (import ./tealdeer.nix {inherit pkgs;})
    (import ./yazi.nix {inherit pkgs lib;})
    ./dconf.nix
    ./nh.nix
    ./pay-respects.nix
    ./starship.nix
    ./zoxide.nix
  ];
}
