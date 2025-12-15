{
  environment = {
    etc."nix".source = /home/es-sai-fi/nixfiles;
    variables = {
      NIXOS_OZONE_WL = "1";
      REGISTRY_AUTH_FILE = "/home/es-sai-fi/.config/containers/auth.json";
    };
  };
}
