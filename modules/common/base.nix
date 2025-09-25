{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    nano
    git
    wget
    curl
    fastfetch
    htop
    btop
    pciutils
    usbutils
  ];
}
