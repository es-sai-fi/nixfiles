{
  pkgs,
  niriModule,
  niriOverlay,
  niriPackage,
  xwaylandPackage,
}: let
  niriWrapped = import ../wrappers/niri {inherit pkgs niriPackage;};
in {
  imports = [niriModule];

  nixpkgs.overlays = [niriOverlay];

  environment.systemPackages = with pkgs; [
    nautilus
    xwaylandPackage
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
