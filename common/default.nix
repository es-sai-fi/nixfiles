{
  system,
  pkgs,
  lib,
  inputs,
}: {
  imports = [
    (import ./boot.nix {inherit pkgs;})
    (import ./packages.nix {inherit pkgs;})
    (import ./programs {inherit system pkgs lib inputs;})
    (import ./impermanence.nix {inherit lib;})
    ./networking.nix
    ./nix.nix
    ./security.nix
    ./users.nix
    ./variables.nix
  ];
}
