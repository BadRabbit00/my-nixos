{ config, pkgs, ... }:

{
  users.users.badrabbit = {
    isNormalUser = true;
    description = "BadRabbit";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" "bluetooth" "lp" ];
    shell = pkgs.zsh;
  };
}
