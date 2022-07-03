{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    chromium
    firefox

    tdesktop

    libreoffice-fresh
    evince

    system-config-printer

    wget
    curl

    openboard
    gimp

    pavucontrol
    easyeffects

    matcha-gtk-theme
    papirus-icon-theme
    gnome.gnome-tweaks

    neofetch

    geekbench
  ];
}
