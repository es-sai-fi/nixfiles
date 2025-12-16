{
  system,
  pkgs,
  lib,
  inputs,
}: let
  impermanenceModule = inputs.impermanence.nixosModules.default;
in {
  imports = [
    (import ./impermanence.nix {inherit lib impermanenceModule;})
    (import ./services {inherit lib inputs;})
    (import ./boot.nix {inherit pkgs;})
    (import ./packages.nix {inherit pkgs;})
    (import ./programs {inherit system pkgs lib inputs;})
    ./environment.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./security.nix
    ./users.nix
    ./virtualisation.nix
    ./xdg.nix
  ];
}
