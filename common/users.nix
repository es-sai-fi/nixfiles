{
  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPassword = "";
      };
      es-sai-fi = {
        hashedPassword = "";
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
