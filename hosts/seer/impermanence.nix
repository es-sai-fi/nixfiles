{lib}: {
  boot.initrd.postResumeCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount /dev/disk/by-label/nixos /btrfs_tmp

    if [[ -e /btrfs_tmp/root ]]; then
      btrfs subvolume delete /btrfs_tmp/root
    fi

    btrfs subvolume create /btrfs_tmp/root

    umount /btrfs_tmp
  '';

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/flatpak"
      "/var/lib/systemd/coredump"
      "/var/lib/systemd/timers"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      "/etc/machine-id"
    ];
    users.es-sai-fi = {
      directories = [
        "Downloads"
        "Pictures"
        "Documents"
        "Projects"
        ".config"
        ".firefox"
        ".mozilla"
        {
          directory = ".ssh";
          mode = "0700";
        }
        ".local/state/wireplumber"
        ".local/share/containers"
        ".local/share/fish"
        ".local/share/sleepy-launcher"
        ".local/share/applications"
        ".local/share/anime-game-launcher"
        ".local/share/zoxide"
        ".local/share/honkers-railway-launcher"
        {
          directory = ".local/share/keyrings";
          mode = "0700";
        }
      ];
    };
  };
}
