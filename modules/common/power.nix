{ config, pkgs, ... }:

{
  services.tlp.enable = true;
  services.auto-cpufreq.enable = true;
  services.fwupd.enable = true;
}
