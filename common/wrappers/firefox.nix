{pkgs}:
pkgs.wrapFirefox pkgs.firefox-unwrapped {
  extraPolicies = {
    Preferences = {
      "media.eme.enabled" = true;
      "privacy.globalprivacycontrol.enabled" = true;
      "webgl.disabled" = false;
      "extensions.update.enabled" = false;
      "pdfjs.forcePageColors" = true;
      "pdfjs.pageColorsBackground" = "#1C1C1C";
      "pdfjs.pageColorsForeground" = "#E0E0E0";
    };

    ExtensionSettings = {
      "*" = {
        installation_mode = "blocked";
      };

      "uBlock0@raymondhill.net" = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        default_area = "menupanel";
        private_browsing = true;
      };

      "jid1-BoFifL9Vbdl2zQ@jetpack" = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/latest.xpi";
        default_area = "menupanel";
        private_browsing = true;
      };

      "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}" = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/auto-tab-discard/latest.xpi";
        default_area = "menupanel";
        private_browsing = true;
      };

      "jid1-MnnxcxisBPnSXQ@jetpack" = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
        default_area = "menupanel";
        private_browsing = true;
      };

      "{74f5d1a6-a6c6-412c-b596-32586a199423}" = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/saphirefox/latest.xpi";
        private_browsing = true;
      };
    };

    SearchEngines = {
      Default = "DuckDuckGo";
    };

    DisableFirefoxScreenshots = true;
    DisableFirefoxStudies = true;
    DisableTelemetry = true;
    DontCheckDefaultBrowser = true;

    DisplayBookmarksToolbar = "never";
    DisplayMenuBar = "never";

    EnableTrackingProtection = {
      Value = true;
      Cryptomining = true;
      Fingerprinting = true;
      EmailTracking = true;
    };

    FirefoxHome = {
      Search = true;
      TopSites = false;
      SponsoredTopSites = false;
      Highlights = false;
      Pocket = false;
      SponsoredPocket = false;
      Stories = false;
      SponsoredStories = false;
      Snippets = false;
    };

    FirefoxSuggest = {
      ImproveSuggest = false;
      SponsoredSuggestions = false;
      WebSuggestions = false;
    };

    GenerativeAI = {
      Enabled = false;
    };

    HardwareAcceleration = true;

    Homepage = {
      StartPage = "previous-session";
    };

    HttpsOnlyMode = "force-enabled";

    OfferToSaveLogins = false;

    OverrideFirstRunPage = "";

    PictureInPicture = {
      Enabled = false;
    };

    PromptForDownloadLocation = false;

    TranslateEnabled = false;

    UserMessaging = {
      SkipOnboarding = true;
      UrlbarInterventions = false;
    };
  };
}
