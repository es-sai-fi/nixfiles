{
  system,
  pkgs,
  dms,
}: {
  imports = [dms.nixosModules.dankMaterialShell];

  programs.dms-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableVPN = false;
    enableSystemSound = false;
    enableDynamicTheming = false;
    enableColorPicker = false;
    enableClipboard = false;
    enableCalendarEvents = false;
    enableBrightnessControl = false;
    enableAudioWavelength = false;
  };
}
