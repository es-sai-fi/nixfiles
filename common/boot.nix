{pkgs}: {
  boot = {
    kernelParams = ["boot.shell_on_fail"];
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
