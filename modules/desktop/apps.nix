{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    google-chrome
    telegram-desktop
    spotify
    steam
    vscode
    docker
    hyper
    rofi
    jdk
  ];
  virtualisation.docker.enable = true;
}
