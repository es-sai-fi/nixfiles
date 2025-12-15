{
  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPasswordFile = "../secrets/root_password.txt";
      };
      es-sai-fi = {
        hashedPasswordFile = "../secrets/es-sai-fi_password.txt";
        isNormalUser = true;
        extraGroups = [
          "networkmanager"
          "wheel"
          "podman"
        ];
      };
    };
  };
}
