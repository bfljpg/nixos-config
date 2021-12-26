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
    geekbench
    gimp

    (vscode-with-extensions.override { vscodeExtensions = with vscode-extensions; [ ms-vscode.cpptools ];
    })
  ];
}
