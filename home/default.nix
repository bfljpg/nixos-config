{ pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools
    bootiso
    gdb
    python3
    gcc
    ghc
    usbutils
    pciutils
    scrcpy
    lm_sensors
    rar
    efibootmgr
  ]; 

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
  };
}
