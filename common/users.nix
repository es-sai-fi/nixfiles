{
  users.mutableUsers = false;
  users.users.root = {
    hashedPasswordFile = "/persist/secrets/root_password.txt";
  };
  users.users.es-sai-fi = {
    hashedPasswordFile = "/persist/secrets/es-sai-fi_password.txt";
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "podman"
    ];
  };
}
