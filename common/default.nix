{
  system,
  pkgs,
  lib,
  inputs,
}: {
  imports = [
    (import ./services {inherit lib inputs;})
    (import ./boot.nix {inherit pkgs;})
    (import ./packages.nix {inherit pkgs;})
    (import ./programs {inherit system pkgs lib inputs;})
    ./environment.nix
    ./networking.nix
    ./nix.nix
    ./security.nix
    ./users.nix
    ./virtualisation.nix
  ];
}
