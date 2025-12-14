{pkgs}: {
  boot = {
    kernelParams = ["boot.shell_on_fail"];
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };
      #limine.enable = true; only if we decide to use limine
      efi.canTouchEfiVariables = true;
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
