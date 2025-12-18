{
  lib,
  fetchFromGitHub,
  mkYaziPlugin,
}:
mkYaziPlugin {
  pname = "gruvbox-dark.yazi";
  version = "2025-08-15";

  src = fetchFromGitHub {
    owner = "poperigby";
    repo = "gruvbox-dark-yazi";
    rev = "a251bd2d88feb61dfe6d4c4583c3b0a969c41bdb";
    hash = "sha256-4XRm23i9XpgAO+08iPM0xGppnIfuP+xzxzO6UMfvy28=";
  };

  meta = {
    description = "Gruvbox Dark theme for Yazi";
    homepage = "https://github.com/poperigby/gruvbox-dark-yazi";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [];
  };
}
