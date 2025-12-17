{pkgs}:
pkgs.symlinkJoin {
  name = "bottom-wrapped";
  paths = [pkgs.bottom];
  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/btm \
      --add-flags "--theme gruvbox"
  '';
  meta.mainProgram = "btm";
}
