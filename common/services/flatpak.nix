{
  lib,
  declarative-flatpak,
}: {
  imports = [declarative-flatpak.nixosModules.default];

  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      "flathub:app/org.vinegarhq.Sober//stable"
    ];
  };
}
