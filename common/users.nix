{
  users.mutableUsers = false;
  users.users.es-sai-fi = {
    name = "es-sai-fi";
    description = "es-sai-fi";
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "podman"
    ];
  };
}
