{
  system,
  pkgs,
  dmsModule,
  greeterModule,
}: {
  imports = [dmsModule greeterModule];

  programs.dankMaterialShell = {
    enable = true;
    greeter = {
      enable = true;
      compositor.name = "niri";
    };
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableVPN = false;
    enableDynamicTheming = false;
    enableCalendarEvents = false;
    enableAudioWavelength = false;
  };

  hjem.users.es-sai-fi = {
    xdg.config.files."DankMaterialShell/default-settings.json" = {
    };
    xdg.state.files."DankMaterialShell/default-session.json" = {
    };
  };
}
