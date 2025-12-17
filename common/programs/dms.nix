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

  hjem.users.es-sai-fi = let
    json = pkgs.formats.json {};
    dmsDefaultConfig = {
      clockDateFormat = "dd-MM-yyyy";
      appLauncherViewMode = "grid";
      spotlightModalViewMode = "grid";
      weatherEnabled = false;
      iconTheme = "System Default";
      launcherLogoMode = "os";
      barConfigs = [
        {
          id = "default";
          name = "Main Bar";
          enabled = true;
          position = 0;
          screenPreferencess = ["all"];
          showOnLastDisplay = true;
          leftWidgets = [
            "launcherButton"
            "workspaceSwitcher"
            "focusedWindow"
          ];
          centerWidgets = [
            "music"
            "clock"
            "weather"
          ];
          rightWidgets = [
            {
              id = "systemTray";
              enabled = true;
            }
            {
              id = "clipboard";
              enabled = true;
            }
            {
              id = "cpuTemp";
              enabled = true;
            }
            {
              id = "cpuUsage";
              enabled = true;
            }
            {
              id = "memUsage";
              enabled = true;
            }
            {
              id = "notificationButton";
              enabled = true;
            }
            {
              id = "battery";
              enabled = true;
            }
            {
              id = "controlCenterButton";
              enabled = true;
            }
          ];
          spacing = 4;
          innerPadding = 4;
          bottomGap = 0;
          transparency = 1;
          widgetTransparency = 1;
          squareCorners = true;
          noBackground = false;
          gothCornersEnabled = false;
          gothCornerRadiusOverride = false;
          gothCornerRadiusValue = 12;
          borderEnabled = false;
          borderColor = "surfaceText";
          borderOpacity = 1;
          borderThickness = 1;
          widgetOutlineEnabled = false;
          widgetOutlineColor = "primary";
          widgetOutlineOpacity = 1;
          widgetOutlineThickness = 1;
          fontScale = 1;
          autoHide = false;
          autoHideDelay = 250;
          openOnOverview = false;
          visible = true;
          popupGapsAuto = true;
          popupGapsManual = 4;
          maximizeDetection = true;
          scrollEnabled = true;
          scrollXBehavior = "column";
          scrollYBehavior = "workspace";
        }
      ];
    };
    dmsClipboardConfig = {
      maxHistory = 100;
      maxEntrySize = 5242880;
      autoClearDays = 0;
      cleartAtStartup = true;
      disabled = false;
      disableHistory = false;
      disablePersist = false;
    };
    dmsDefaultState = {
      nightModeEnabled = true;
      nightModeTemperature = 3000;
    };
  in {
    xdg.config.files."DankMaterialShell/default-settings.json" = {
      source = json.generate "dms-config.json" dmsDefaultConfig;
    };
    xdg.config.files."DankMaterialShell/clsettings.json" = {
      source = json.generate "dms-clipboard-config.json" dmsClipboardConfig;
    };
    xdg.state.files."DankMaterialShell/default-session.json" = {
      source = json.generate "dms-state.json" dmsDefaultState;
    };
  };
}
