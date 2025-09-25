{ config, pkgs, ... }:

{
  services.chrony.enable = true;
  # Or use systemd-timesyncd
  # time.timeZone = "Europe/Moscow";
}
