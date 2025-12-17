{pkgs}: {
  programs.fish = {
    enable = true;
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
