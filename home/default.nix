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

  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    shell = "${pkgs.zsh}/bin/zsh";
    window.opacity = 0.7;
    font.size = 10.0;
  };

  programs.zsh.enable = true;
  programs.zsh.oh-my-zsh.enable = true;
  programs.zsh.oh-my-zsh.theme = "robbyrussell";
  programs.zsh.oh-my-zsh.plugins = [ "git" ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      ms-python.python
      golang.go
    ];
  };
}
