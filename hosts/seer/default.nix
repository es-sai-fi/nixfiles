{
  lib,
  inputs,
}: let
  inherit (inputs) impermanence;
in {
  imports = [
    #(import ./impermanence.nix {inherit lib;})
    ./hardware-configuration.nix
    ./graphics.nix
    #impermanence.nixosModules.default
  ];

  networking.hostName = "seer";

  system.stateVersion = "25.05";
}
