{ config, pkgs, ... }:

{
  home-manager.users.badrabbit = {
    # home.nix will be imported here
    imports = [ ];

    home.stateVersion = "23.11";
  };
}
