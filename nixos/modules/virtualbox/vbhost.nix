{ config, pkgs, ...}:

{
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "katharye" ];
    
    virtualisation.virtualbox.host.enableExtensionPack = true;

    # environment.systemPackages = with pkgs; [
        # virtualbox
    # ];

    # boot.loader.systemd-boot.enable = true;
    # boot.loader.efi.canTouchEfiVariables = true;
}