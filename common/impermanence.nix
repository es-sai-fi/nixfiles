{
  lib,
  impermanenceModule,
}: {
  imports = [impermanenceModule];

  # Script taken from raf
  boot.initrd.postDeviceCommands = lib.mkBefore ''
    mkdir -p /mnt

    # We first mount the BTRFS root to /mnt
    # so we can manipulate btrfs subvolumes.
    mount -t btrfs -o subvol=/ /dev/disk/by-label/nixos /mnt

    # While we're tempted to just delete /root and create
    # a new snapshot from /root-blank, /root is already
    # populated at this point with a number of subvolumes,
    # which makes `btrfs subvolume delete` fail.
    # So, we remove them first.
    #
    # /root contains subvolumes:
    # - /root/var/lib/portables
    # - /root/var/lib/machines

    btrfs subvolume list -o /mnt/root |
      cut -f9 -d' ' |
      while read subvolume; do
        echo "deleting /$subvolume subvolume..."
        btrfs subvolume delete "/mnt/$subvolume"
      done &&
      echo "deleting /root subvolume..." &&
      btrfs subvolume delete /mnt/root
    echo "restoring blank /root subvolume..."
    btrfs subvolume snapshot /mnt/root-blank /mnt/root

    # Once we're done rolling back to a blank snapshot,
    # we can unmount /mnt and continue on the boot process.
    umount /mnt
    echo "disk unmounted"
  '';

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
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
        "Videos"
        "Pictures"
        "Documents"
        "Projects"
        "nixfiles"
        ".cache/nix"
        ".mozilla"
        ".config/DankMaterialShell"
        ".config/fish"
        ".config/obs-studio"
        ".local/state/DankMaterialShell"
        ".local/state/wireplumber"
        ".local/share/containers"
        ".local/share/fish"
        ".local/share/sleepy-launcher"
        ".local/share/applications"
        ".local/share/anime-game-launcher"
        ".local/share/zoxide"
        ".local/share/honkers-railway-launcher"
        {
          directory = ".ssh";
          mode = "0700";
        }
        {
          directory = ".local/share/keyrings";
          mode = "0700";
        }
      ];
    };
  };
}
