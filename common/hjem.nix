{inputs, ...}: {
  imports = [inputs.hjem.nixosModules.hjem];

  hjem = {
    users = {
      es-sai-fi = {
        user = "es-sai-fi";
        directory = "/home/es-sai-fi";
      };
    };
    clobberByDefault = true;
  };
}
