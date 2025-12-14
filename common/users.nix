{
  users.mutableUsers = false;
  users.users.es-sai-fi = {
    hashedPasswordFile = ../secrets/password.txt;
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "podman"
    ];
  };
}
