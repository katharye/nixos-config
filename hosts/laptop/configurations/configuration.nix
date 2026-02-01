{ config, lib, pkgs, ... }:

{
  imports =
    [
      ../../../nixos/modules/hyprland.nix
      ../../../nixos/modules

      ../hardware-configuration.nix

      ../../../nixos/packages.nix
      ./local-packages.nix
    ];	

  time.timeZone = "Europe/Moscow";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";

}

