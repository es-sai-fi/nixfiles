{
  lib,
  pkgs,
  inputs,
  ...
}: let
  niriWrapped = import ../wrappers/niri {
    inherit pkgs lib;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };
in {
  imports = [inputs.niri.nixosModules.niri];

  nixpkgs.overlays = [inputs.niri.overlays.niri];

  environment.systemPackages = with pkgs; [
    nautilus
    inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.xwayland-satellite-unstable
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gnome
    ];
    config = {
      niri.default = "gnome";
      common.default = "gnome";
      obs.default = "gnome";
    };
  };

  programs.niri = {
    enable = true;
    package = niriWrapped;
  };
}
