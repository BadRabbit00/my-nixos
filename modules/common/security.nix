{ config, pkgs, ... }:

{
  security.sudo.enable = true;
  security.polkit.enable = true;
  # services.openssh.enable = true; # Uncomment to enable SSH
}
