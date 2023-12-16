{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    chromium
    firefox
    tdesktop
    evince
    wget
    curl
    openboard
    gimp
    pavucontrol
    easyeffects
    matcha-gtk-theme
    papirus-icon-theme
    # gnome.gnome-tweaks
    neofetch
    kdiskmark
    geekbench
    wineWowPackages.waylandFull
    virt-manager
  ];
}
