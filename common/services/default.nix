{
  lib,
  inputs,
}: let
  inherit (inputs) declarative-flatpak;
in {
  imports = [
    (import ./flatpak.nix {inherit lib declarative-flatpak;})
    ./pipewire.nix
    ./xserver.nix
  ];
}
