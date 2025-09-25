{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./disko.nix
      ../../modules/common/base.nix
      ../../modules/common/networking.nix
      ../../modules/common/security.nix
      ../../modules/common/time.nix
      ../../modules/common/filesystem.nix
      ../../modules/common/power.nix
      ../../modules/common/bluetooth.nix
      ../../modules/desktop/hyprland.nix
      ../../modules/desktop/sddm.nix
      ../../modules/desktop/pipewire.nix
      ../../modules/desktop/cups.nix
      ../../modules/desktop/apps.nix
      ../../modules/users/badrabbit.nix
      ../../home/badrabbit/home.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "23.11";
}
