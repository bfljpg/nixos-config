{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    rustc
    cargo
    android-tools
    bootiso
    gdb
    python3
    gcc
    ghc
    usbutils
    pciutils
  ]; 
}
