{pkgs}: let
  firefoxWrapped = import ../wrappers/firefox.nix {inherit pkgs;};
in {
  programs.firefox = {
    enable = true;
    package = firefoxWrapped;
  };
}
