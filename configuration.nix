{ pkgs, lib, config, ... }:

{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  
  boot.kernelPackages = pkgs.linuxPackages_xanmod;
  
  boot.kernelParams = [
    "quiet"
    "nomce"
    "nowatchdog"
    "loglevel=3"
    "mitigations=off"
  ];

  networking.networkmanager.enable = true;

  services.xserver.layout = "tr";
  i18n.defaultLocale = "tr_TR.UTF-8";
  time.timeZone = "Europe/Istanbul";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "trq";
  };

  programs = {
    steam.enable = true;
    kdeconnect.enable = true;
  };

  users.users.emircnkr = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "13.12.1989";
  };

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };

  virtualisation = {
    virtualbox.host.enable = true;
  };

  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  home-manager.users.emircnkr.home.stateVersion = "23.05";

  services.udev.packages = [ pkgs.android-udev-rules ];

  system.stateVersion = "unstable";
}
