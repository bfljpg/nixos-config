{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    firefox
    tdesktop
    libreoffice-fresh
    evince
    system-config-printer
    vlc
    wget
    curl
    nmap
    openboard
    alacritty
    pavucontrol
    matcha-gtk-theme
    papirus-icon-theme
    neofetch
    vscodium
  ];
}
