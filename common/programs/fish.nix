{pkgs}: let
  fishWrapped = import ../wrappers/fish {inherit pkgs;};
in {
  programs.fish = {
    enable = true;
    package = fishWrapped;
    useBabelfish = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      cd = "z";
      cat = "bat";
    };
  };
}
