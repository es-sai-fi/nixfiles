{pkgs}:
pkgs.wrapFirefox pkgs.firefox-unwrapped {
  extraPoliciesFiles =
    map
    (file: pkgs.writeText "policies.json" (builtins.readFile file)) [
      ./policies/policies.json
      ./policies/extensions.json
      ./policies/preferences.json
      ./policies/searchEngines.json
    ];
}
