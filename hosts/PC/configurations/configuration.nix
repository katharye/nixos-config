{ config, lib, pkgs, ... }:

{
  imports =
    [
      ../../../nixos/modules

      ../hardware-configuration.nix
      ./drivers.nix

      ../../../nixos/packages.nix
    ];	

  time.timeZone = "Europe/Moscow"; 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05"; 

  # swapDevices = [{
  #   device = "/var/lib/swapfile";
  #   size = 36*1024; # 36 GB
  # }];
}

