{ config, pkgs, ... }:

{
  services.btrfs.autoScrub.enable = true;
  services.snapper.configs."root" = {
    SUBVOLUME = "/";
    ALLOW_USERS = [ "badrabbit" ];
    TIMELINE_CREATE = true;
  };
  services.snapper.configs."home" = {
    SUBVOLUME = "/home";
    ALLOW_USERS = [ "badrabbit" ];
    TIMELINE_CREATE = true;
  };
  services.autofs.enable = true;
}
