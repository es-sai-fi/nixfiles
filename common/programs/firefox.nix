{pkgs}: let
  firefoxWrapped = import ../wrappers/firefox {inherit pkgs;};
in {
  programs.firefox = {
    enable = true;
    package = firefoxWrapped;
  };
}
