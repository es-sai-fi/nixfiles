{pkgs}: let
  firefoxWrapped = import ../wrappers/firefox {inherit pkgs;};
in {
  environtment.systemPackages = [firefoxWrapped];
  };
}
