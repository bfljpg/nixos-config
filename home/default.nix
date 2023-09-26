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
    efibootmgr
  ]; 
}
