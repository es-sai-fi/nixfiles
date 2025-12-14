{
  users.mutableUsers = false;
  users.users.root = {
    hashedPasswordFile = ../secrets/root_password.txt;
  };
  users.users.es-sai-fi = {
    hashedPasswordFile = ../secrets/es-sai-fi_password.txt;
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "podman"
    ];
  };
}
