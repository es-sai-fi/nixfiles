{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
    download-buffer-size = 134217728;
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
