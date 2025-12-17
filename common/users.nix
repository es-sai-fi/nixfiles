{
  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPassword = "$2b$05$x9mbVevzumb8joETyX4bo.w68MAVkCZtEsPBqwF8f8t75PmAZlziu";
      };
      es-sai-fi = {
        hashedPassword = "$2b$05$6gW1wCrbGjzcxFxxmVGE/ey.mt5BsMOEXsId4vlEX9PbVMbpKb.IC";
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
