{pkgs}: let
  firefoxWrapped = import ../wrappers/firefox {inherit pkgs;};
in {
  environment.systemPackages = [firefoxWrapped];
}
