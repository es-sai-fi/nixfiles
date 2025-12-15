{
  system,
  pkgs,
  dmsPackage,
  dgopPackage,
}: {
  environment.systemPackages = [dgopPackage];

  programs.dms-shell = {
    enable = true;
    package = dmsPackage;
    systemd.restartIfChanged = true;
    enableVPN = false;
    enableSystemSound = false;
    enableSystemMonitoring = false; # We use a custom dgop package.
    enableDynamicTheming = false;
    enableColorPicker = false;
    enableClipboard = false;
    enableCalendarEvents = false;
    enableBrightnessControl = false;
    enableAudioWavelength = false;
  };
}
