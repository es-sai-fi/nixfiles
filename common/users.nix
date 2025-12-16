{
  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPasswordFile = "$2b$05$mYBdcJa5jlZpHxGPh5BU2e85DWEJ6idyHHx5VU95..aVlqrW4Rkp.";
      };
      es-sai-fi = {
        hashedPasswordFile = "$2b$05$9kSTPUMSrjUorQEVitlqde.mHnup4fpREQsk9cAw3ylUks75j2t2e";
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
