{
  services = {
    flatpak.enable = true;
    xserver.xkb = {
      layout = "es";
      variant = "";
    };
    pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
