{pkgs}: {
  boot = {
    kernelParams = ["boot.shell_on_fail"];
    loader = {
      limine = {
        enable = true;
        #secureBoot.enable = true;
      };
      efi.canTouchEfiVariables = true;
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
