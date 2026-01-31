{ config, lib, pkgs, ... }:

{
  imports =
    [
      ../../../nixos/modules/plasma6.nix
      ../../../nixos/modules

      ../hardware-configuration.nix
      ./drivers.nix

      ../../../nixos/packages.nix
    ];	

  time.timeZone = "Europe/Moscow"; 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05"; 

}

