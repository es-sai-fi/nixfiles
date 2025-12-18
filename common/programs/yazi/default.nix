{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    settings = {
      yazi.mgr = {
        show_hidden = true;
        sort_by = "mtime";
        sort_dir_first = true;
        sort_reverse = true;
      };
      theme = {dark = "gruvbox-dark.yazi";};
    };
    flavors = {
      gruvbox-dark = pkgs.callPackage ./gruvbox-dark.nix {mkYaziPlugin = pkgs.yaziPlugins.mkYaziPlugin;};
    };
    plugins = {
      inherit
        (pkgs.yaziPlugins)
        wl-clipboard
        sudo
        smart-paste
        smart-enter
        ;
    };
  };
}
