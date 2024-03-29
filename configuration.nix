{ pkgs, lib, config, ... }:

{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      # assuming /boot is the mount point of the  EFI partition in NixOS (as the installation section recommends).
      efiSysMountPoint = "/boot";
    };
    grub = {
      # despite what the configuration.nix manpage seems to indicate,
      # as of release 17.09, setting device to "nodev" will still call
      # `grub-install` if efiSupport is true
      # (the devices list is not used by the EFI grub install,
      # but must be set to some value in order to pass an assert in grub.nix)
      devices = [ "nodev" ];
      efiSupport = true;
      enable = true;
      /*
      # set $FS_UUID to the UUID of the EFI partition
      extraEntries = ''
        menuentry "Windows" {
          insmod part_gpt
          insmod fat
          insmod search_fs_uuid
          insmod chain
          search --fs-uuid --set=root 0C0E-90BF
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }
      '';
      */
    };
  };
  boot.plymouth.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_zen;
  
  boot.kernelParams = [
    "quiet"
    "nomce"
    "nowatchdog"
    "loglevel=3"
    "mitigations=off"
  #  "amd_pstate=disable"
  ];

  # I'll set it as comment if I want to switch cpufreq from amd_pstate and noboost service again.
  /*
  systemd.services.noturbo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.coreutils ];
    enable = false;
    serviceConfig = {
      User = "root";
      Group = "root";
    };
    script = ''echo "0" | tee /sys/devices/system/cpu/cpufreq/boost'';
  };
  */

  networking.networkmanager.enable = true;

  services.xserver.layout = "tr";
  i18n.defaultLocale = "tr_TR.UTF-8";
  time.timeZone = "Europe/Istanbul";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "trq";
  };

  virtualisation.libvirtd.enable = true;
  
  programs = {
    kdeconnect.enable = true;
    dconf.enable = true;
    steam.enable = true;
  };
  
  users.users.emircnkr = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    initialPassword = "13.12.1989";
  };

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };
   
  home-manager.users.emircnkr.home.stateVersion = "24.05";

  services.udev.packages = [ pkgs.android-udev-rules ];

  system.stateVersion = "unstable";
}
