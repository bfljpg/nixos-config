{ pkgs, lib, config, ... }:

{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  
  boot.kernelPackages = pkgs.linuxPackages_xanmod;
  
  hardware.cpu.intel.updateMicrocode = true;
  
  boot.kernelParams = [
    "quiet"
    "nomce"
    "nowatchdog"
    "quiet"
    "loglevel=2"
    "modules_blacklist=iTCO_wdt"
    "i915.fastboot=1"
    "mitigations=off"
  ];

  programs.bash.shellAliases = {
    rebuild-nixos-online = "sudo nixos-rebuild switch --flake github:emircnkr196/nixos-config#es1-572";
    rebuild-nixos = "sudo nixos-rebuild switch --flake /home/emircnkr/nixos-config#es1-572";
  };

  networking.networkmanager.enable = true;

  fonts.fonts = with pkgs; [
    open-sans
    source-code-pro
    noto-fonts
  ];

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

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  services.udev.packages = [ pkgs.android-udev-rules ];

  system.stateVersion = "unstable";
}
