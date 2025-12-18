{
  pkgs,
  lib,
  niriPackage,
}: let
  # Taken from @Lunarnovaa
  niriConfigFile = pkgs.concatText "config.kdl" (lib.filesystem.listFilesRecursive ./config);
in
  pkgs.symlinkJoin {
    name = "niri-wrapped";
    paths = [niriPackage];
    passthru = {
      inherit
        (niriPackage)
        cargoBuildNoDefaultFeatures
        cargoBuildFeatures
        providedSessions
        ;
    };
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      mkdir -p $out/niri
      cp ${niriConfigFile} $out/niri/config.kdl

      wrapProgram $out/bin/niri-session \
        --set NIRI_CONFIG $out/niri/config.kdl

      wrapProgram $out/bin/niri \
        --set NIRI_CONFIG $out/niri/config.kdl
    '';
    meta.mainProgram = "niri";
  }
